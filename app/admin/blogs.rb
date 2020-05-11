ActiveAdmin.register Blog do
  config.filters = false
  
  permit_params :title, :introduction, :description, :tags, :status, :order, :slug, :image

  index do
    column :title
    column :tags
    column :order
    toggle_bool_column :status
    column :created_at
    column :updated_at
    actions
  end

  show do |project|
    panel 'Project Information' do
      attributes_table_for(project) do
        row :title
        row :introduction do |project|
          project.introduction.html_safe
        end
        row :description do |project|
          project.description.html_safe
        end
        list_row 'Tags' do |project|
          project.tags.split(',').to_a
        end
        row :order
        row :status
        row :image do |project|
          if project.image.present?
            image_tag(project.image.variant(resize: '250x250!'))
          end
        end
        row :created_at
        row :updated_at
      end
    end
  end

  form do |f|
    f.inputs 'Project Information' do
      f.input :title
      f.input :introduction, as: :medium_editor
      f.input :description, as: :medium_editor
      f.input :tags, as: :tags
      if f.object.new_record? || f.object.image.blank?
        f.input :image, as: :file
      elsif !f.object.image.content_type.in?(%w(image/png image/jpg image/jpeg))
        f.input :image, as: :file
      else
        f.input :image, as: :file, hint: image_tag(f.object.image.variant(resize: '250x250!'))
      end
      f.input :order
      f.input :status
    end
  
    f.actions
  end

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end
end

ActiveAdmin.register Project do
  config.filters = false

  permit_params :title, :description, :project_type, :tags, :website, :order, :status, :image, :introduction

  index do
    column :title
    column :tags
    column :project_type
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
        row :project_type
        row :website
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
      f.input :introduction, as: :medium_editor, input_html: {  class: 'medium-editor' }
      f.input :description, as: :medium_editor, input_html: {  class: 'medium-editor' }
      f.input :tags, as: :tags
      if f.object.new_record? || f.object.image.blank?
        f.input :image, as: :file
      elsif !f.object.image.content_type.in?(%w(image/png image/jpg image/jpeg))
        f.input :image, as: :file
      else
        f.input :image, as: :file, hint: image_tag(f.object.image.variant(resize: '250x250!'))
      end
      f.input :website
      f.input :project_type, as: :select, collection: Project.project_types.keys
      f.input :order
      f.input :status
    end

    f.actions
  end
end

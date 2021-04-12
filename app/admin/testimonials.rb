ActiveAdmin.register Testimonial do
  config.filters = false

  permit_params :name, :designation, :project, :content, :status, :facebook, :instagram, :github, :linkedin, :avatar

  index do
    column :name
    column :designation
    column :project
    toggle_bool_column :status
    column :created_at
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :name
      row :designation
      row :project
      row :content do |testimonial|
        testimonial.content.html_safe
      end
      row :image do |testimonial|
        if testimonial.avatar.url.present?
          image_tag(testimonial.avatar.url)
        end
      end
      row :status
      row :linkedin
      row :github
      row :facebook
      row :instagram
    end
  end

  form do |f|
    f.inputs 'Testimonial Information' do
      f.input :name
      f.input :designation
      f.input :project
      f.input :content, as: :medium_editor, input_html: {  class: 'medium-editor' }
      f.input :avatar
      f.input :github
      f.input :linkedin
      f.input :facebook
      f.input :instagram
      f.input :status
    end

    f.actions
  end
end

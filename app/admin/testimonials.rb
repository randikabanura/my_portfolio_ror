ActiveAdmin.register Testimonial do
  config.filters = false

  permit_params :name, :designation, :project, :content, :status

  index do
    column :name
    column :designation
    column :project
    toggle_bool_column :status
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    f.inputs 'Testimonial Information' do
      f.input :name
      f.input :designation
      f.input :project
      f.input :content, as: :medium_editor, input_html: {  class: 'medium-editor' }
      f.input :status
    end

    f.actions
  end
end

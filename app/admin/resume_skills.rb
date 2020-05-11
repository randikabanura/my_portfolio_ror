ActiveAdmin.register ResumeSkill do
  menu label: 'Resume Skill', priority: 2, parent: 'Resume'
  config.filters = false
  
  permit_params :order, :title, :percentage, :status

  index do
    column :title
    column :percentage
    column :order
    toggle_bool_column :status
    column :created_at
    column :updated_at
    actions
  end
  
  form do |f|
    f.inputs do
      f.input :title
      f.input :percentage
      f.input :order
      f.input :status
    end
  
    f.actions
  end
end

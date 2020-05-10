ActiveAdmin.register ResumeSkill do
  menu label: 'Resume Skill', priority: 2, parent: 'Resume'
  config.filters = false
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :order, :title, :percentage
  #
  # or
  #
  # permit_params do
  #   permitted = [:order, :title, :percentage]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end

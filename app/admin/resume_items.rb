ActiveAdmin.register ResumeItem do
  menu label: 'Resume Item', priority: 1, parent: 'Resume'
  config.filters = false
  
  permit_params :order, :item_type, :description, :title, :start, :end, :status

  scope :education do |item|
    ResumeItem.where(item_type: :education)
  end

  scope :employment do |item|
    ResumeItem.where(item_type: :employment)
  end

  index do
    column :title
    column :start
    column :end
    column :item_type
    column :order
    toggle_bool_column :status
    column :created_at
    column :updated_at
    actions
  end
  
  form do |f|
    f.inputs do
      f.input :title
      f.input :description, as: :medium_editor, input_html: {  class: 'medium-editor' }
      f.input :start, as: :datepicker, datepicker_options: { dateFormat: 'dd/mm/yy', changeMonth: true,
                                                                  changeYear: true }
      f.input :end, as: :datepicker, datepicker_options: { dateFormat: 'dd/mm/yy', changeMonth: true,
                                                          changeYear: true }
      f.input :order
      f.input :item_type, as: :select, collection: ResumeItem.item_types.keys
      f.input :status
    end
    
    f.actions
  end
  
end

ActiveAdmin.register ResumeItem do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :order, :item_type, :description, :title, :start, :end
  #
  # or
  #
  # permit_params do
  #   permitted = [:order, :type, :description, :title, :start, :end]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
  form do |f|
    f.inputs do
      f.input :title
      f.input :description
      f.input :start, as: :datepicker, datepicker_options: {dateFormat: 'dd/mm/yy', changeMonth: true,
                                                                  changeYear: true}
      f.input :end, as: :datepicker, datepicker_options: {dateFormat: 'dd/mm/yy', changeMonth: true,
                                                          changeYear: true}
      f.input :order
      f.input :item_type, as: :select, collection: ResumeItem.item_types.keys
    end
    
    f.actions
  end
  
end

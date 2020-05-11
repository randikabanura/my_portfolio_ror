ActiveAdmin.register SocialLink, as: 'Social' do
  config.filters = false
  
  permit_params :name, :icon_text, :link, :link_type, :order, :status

  index do
    column :name
    column :link
    column :icon_text
    column :link_type
    column :order
    toggle_bool_column :status
    actions
  end
  
  form do |f|
    f.inputs do
      f.input :name
      f.input :link
      f.input :icon_text
      f.input :order
      f.input :link_type, as: :select, collection: SocialLink.link_types.keys
      f.input :status
    end
    
    f.actions
  end
end

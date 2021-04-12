ActiveAdmin.register SiteImage do
  menu label: 'Images', parent: 'Site Details'
  config.filters = false
  actions :all, except: %i[destroy]

  permit_params :slug, :image, :status, :name

  index do
    column :name
    column :image do |site_image|
      if site_image.image.url.present?
        image_tag(site_image.image.thumb.url)
      end
    end
    toggle_bool_column :status
    column :created_at
    column :updated_at
    actions
  end

  show do |document|
    panel 'Document Information' do
      attributes_table_for(document) do
        row :name
        row :image do |site_image|
          if site_image.image.url.present?
            image_tag(site_image.image.medium.url)
          end
        end
        row :status
        row :created_at
        row :updated_at
      end
    end
  end

  form do |f|
    h1 do
      f.object.name
    end
    f.inputs do
      if f.object.new_record? || f.object.image.medium.url.nil?
        f.input :image, as: :file
      else
        f.input :image, as: :file, hint: image_tag(f.object.image.medium.url)
      end
      f.input :status
    end
    f.actions
  end
end

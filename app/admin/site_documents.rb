ActiveAdmin.register SiteDocument do
  menu label: 'Documents', parent: 'Site Details'
  config.filters = false
  actions :all, except: %i[ destroy]

  permit_params :slug, :document, :status, :name

  index do
    column :name
    column :document do |site_document|
      if site_document.document.url.present?
        'Document cannot be previewed'
      else
        'Document is not available'
      end
    end
    toggle_bool_column :status
    column :created_at
    column :updated_at
    actions
  end

  show do |site_document|
    panel 'Document Information' do
      attributes_table_for(site_document) do
        row :name
        row :document do |site_document|
          if site_document.document.url.present?
            'Document cannot be previewed'
          else
            'Document is not available'
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
      if f.object.new_record?
        f.input :document, as: :file
      else
        f.input :document, as: :file, hint: 'Document is already available'
      end
      f.input :status
    end
    f.actions
  end
end

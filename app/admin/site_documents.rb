ActiveAdmin.register SiteDocument do
  menu label: 'Documents'
  config.filters = false
  actions :all, except: %i[ destroy]

  permit_params :slug, :document, :status

  index do
    column :slug
    column :document do |image|
      if image.slug == 'resume'
        'PDF file cannot be previewed'
      elsif image.document.present?
        image_tag(image.document.variant(resize: '50x50!'))
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
        row :slug
        row :document do |image|
          if image.slug == 'resume'
            'PDF file cannot be previewed'
          elsif image.document.present?
            image_tag(image.document.variant(resize: '50x50!'))
          end
        end
        row :status
        row :created_at
        row :updated_at
      end
    end
  end

  form do |f|
    f.inputs do
      if Rails.env.development?
        f.input :slug
      else
        f.input :slug, input_html: { disabled: true }
      end
      if f.object.new_record? || (!f.object.document.present? || f.object.slug == 'resume')
        f.input :document, as: :file
      else
        f.input :document, as: :file, hint: image_tag(f.object.document.variant(resize: '250x250!'))
      end
      f.input :status
    end
    f.actions
  end
end

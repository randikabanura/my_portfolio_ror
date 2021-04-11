ActiveAdmin.register Setting do
  actions :all, except: [:new]
  permit_params :key, :label, :value, :editable, :deletable, :deleted

  index do
    column :label
    column :value
    actions
  end

  show do
    attributes_table do
      row :label
      row :value
      row :updated_at
    end
  end

  form do |f|
    f.inputs do
      f.input :label, input_html: { disabled: true }
      f.input :value
    end

    f.actions
  end
end

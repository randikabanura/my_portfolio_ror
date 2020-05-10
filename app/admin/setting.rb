# frozen_string_literal: true

ActiveAdmin.register_page 'Setting' do
  title = 'Setting'
  menu label: title
  active_admin_settings_page(title: title, display: {
      profile_age: :number,
      profile_phone: :number,
      profile_image: :url,
      profile_introduction: :medium_editor,
      resume_introduction: :medium_editor
  })
end

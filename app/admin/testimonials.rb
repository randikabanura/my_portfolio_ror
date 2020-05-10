ActiveAdmin.register Testimonial do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :designation, :project, :content
  
  form do |f|
    f.inputs 'Tesimonial Information' do
      f.input :name
      f.input :designation
      f.input :project
      f.input :content
    end

    f.actions
  end
end

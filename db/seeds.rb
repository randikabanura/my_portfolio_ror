# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'banura@admin.com', password: 'banura?123', password_confirmation: 'banura?123') if Rails.env.development?
Settler.all

unless SiteDocument.all.any?
  SiteDocument.create!(slug: 'profile_image', name: 'Profile Image')
  SiteDocument.create!(slug: 'profile_background_image', name: 'Profile Background Image')
  SiteDocument.create!(slug: 'resume', name: 'Resume')
  SiteDocument.create!(slug: 'testimonial_background_image', name: 'Testimonial Background Image')
  SiteDocument.create!(slug: 'contact_background_image', name: 'Contact background Image')
end
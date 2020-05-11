# RailsSettings Model
class Setting < RailsSettings::CachedSettings
  
  defaults[:profile_name] = 'Banura Randika'
  defaults[:profile_age] = Time.now.year - 1996
  defaults[:profile_email] = 'randika.banura@gmail.com'
  defaults[:profile_work] = 'Software Developer'
  defaults[:profile_address] = '248, Panadura Road, Horana, Sri Lanka'
  defaults[:profile_image] = nil
  defaults[:profile_phone] = nil
  defaults[:profile_introduction] = ''
  defaults[:profile_introduction_greeting] = 'Hi'
  defaults[:profile_introduction_button_cv] = 'Download CV'

  defaults[:resume_title] = 'Resume'
  defaults[:resume_introduction] = ''
end

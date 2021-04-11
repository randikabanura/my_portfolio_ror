module DateHelper
  def calculate_age(date_birthday)
    date_now = DateTime.now
    TimeDifference.between(date_birthday, date_now).in_years.to_i
  end
end

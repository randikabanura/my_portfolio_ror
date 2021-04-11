class DateTypecaster < Typecaster
  def typecast(value)
    DateTime.strptime(value, '%Y-%m-%d')
  end
end

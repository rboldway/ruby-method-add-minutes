def add_minutes(base,delta)
  raise ArgumentError, "first parameter is not a string" if !base.is_a? String
  raise ArgumentError, "first parameter is an empty string" if base.empty?
  raise ArgumentError, "#{base} is missing AM or PM" unless /(A|P)M\z/.match(base)

  _base = /\A(\d{1,2}):(\d\d) (A|P)M\z/.match(base)
  raise ArgumentError, "#{base} is not [H]H:MM form" if _base.nil?

  hours, minutes = _base[1].to_i, _base[2].to_i
  hours = 0 if hours == 12        #de-standardize
  hours += 12 if _base[3] == 'P'

  begin #convert all into minutes
    hours -= 1
    minutes += 60
  end while hours > 1

  minutes += delta

  begin # covert back to hours & minutes
    hours += 1
    minutes -= 60
  end while minutes >= 60

  hours %= 24   # nornmalize to 24 hour clock
  if hours >= 12
    pm = true
    hours -= 12
  else
    pm = false
  end

  hours = 12 if hours == 0  # standardize back
 "#{hours}:#{'%02d' % minutes} #{pm ? 'PM' : 'AM'}"
end
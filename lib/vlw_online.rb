require 'date'

module VlwOnline

  Reference_Year = 2018

  YouthAgeGroups = {
    :u20 => 19,
    :u18 => 16,
    :u17midi => 15,
    :u16 => 14,
    :u15midi => 13,
    :u14 => 12,
    :u13 => 11,
    :u12 => 10
  }

  ##
  # Calculate the 'closing dates' for the different age groups in youth.
  # These dates are used to determine whether a youth_player is allowed
  # to play a certain youth class or not.
  ##
  def VlwOnline.youth_closing_dates(year)
    closing_dates = {}
    YouthAgeGroups.each do |youth,offset|
      closing_dates[youth] = Date.new(year - offset, 1, 1)
    end
    closing_dates
  end

  ##
  # Indicate whether a player (given by birthday) is allowed to play a certain
  # youth class.
  ##
  def VlwOnline.belongs_to_youth(youth, birthday)
    return (Date.today.year - birthday.year) <= YouthAgeGroups[youth]
  end

end

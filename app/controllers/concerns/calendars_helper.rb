module CalendarsHelper

  def self.createScheduleEvents
    schedule = LeaguesHelper.download_schedule('2015', '345')
    # calendars = Vpim::Icalendar.create
    #
    # schedule.each do |match|
    #   if match[:home] =~ /SSV Ulm/ || match[:guest] =~ /SSV Ulm/
    #     calendars.push Vpim::Icalendar::Vevent.create(
    #         DateTime.strptime("#{match[:date]} #{match[:start_time]}", '%d.%m.%Y %H:%M'),
    #         'SUMMARY' => ["#{match[:home]} - #{match[:guest]}"])
    #   end
    # end

    calendar = RiCal.Calendar do
      default_tzid 'Europe/Berlin'
      schedule.each do |match|
        if match[:home] =~ /SSV Ulm/ || match[:guest] =~ /SSV Ulm/
          event do
            summary     "#{match[:home]} - #{match[:guest]}"
            description "Hallenöffnung: #{match[:opening_time]}\n" +
                        "Spielbeginn: #{match[:opening_time]}\n"
            dtstart     DateTime.strptime("#{match[:date]} #{match[:start_time]}", '%d.%m.%Y %H:%M')
            duration    '+PT2H' # P=period, T=time, H=hours
            location    "#{match[:location]}"
          end
        end
      end
    end


    File.open('ulmVolley.ics', 'w+') do |f|
      f.write(calendar.export)
    end

    calendar

  end
end

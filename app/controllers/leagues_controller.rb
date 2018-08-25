require 'vpim/vcard'
require 'vpim/icalendar'

class LeaguesController < ApplicationController
	before_action :set_league, only: []

	def show
	    vlwData = LeaguesHelper.download_schedule('2018', 74521)
	    calendar = RiCal.Calendar do
		    default_tzid 'Europe/Berlin'
		    vlwData.each do |match|
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
			
		json_response(vlwData) 
	end

private

	def set_league
		@league = League.find(params[:id])
	end
	
	def league_params
		params.permit(:name, :league_id)
	end
end

class League < ApplicationRecord

	validates_presence_of :name
	validates_presence_of :league_id
	
end

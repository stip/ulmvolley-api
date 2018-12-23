# frozen_string_literal: true

require 'vpim/vcard'

module Vpim
  class Vcard
    class Maker

      def add_team(team)
        @card << Vpim::DirectoryInfo::Field.create('X-ULMVOLLEY-TEAM', team.to_str)
      end
    end
  end
end

card = Vpim::Vcard.create

Vpim::Vcard::Maker::make2(card) do |m|
  m.add_name do |n|
    n.given = 'Stip'
  end
  m.add_team 'Damen 2'
end

puts card

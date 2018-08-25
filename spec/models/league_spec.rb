require 'rails_helper'

RSpec.describe League, type: :model do

	it { should validate_presence_of :name }
	it { should validate_presence_of :league_id }
end

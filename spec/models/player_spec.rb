# frozen_string_literal: true

require 'rails_helper.rb'

RSpec.describe Player, type: :model do
  it { should validate_presence_of :name }
end

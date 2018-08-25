require 'rails_helper'

RSpec.describe 'Ulmvolley API - leagues', type: :request do

	let!(:leagues) { create_list(:league, 3) }
	let(:league_id) { leagues.first.id }

	describe 'GET /leagues/:id' do

		before { get "/leagues/#{league_id}" }

		context 'when the record exists' do
			it 'returns the league' do
				expect(json).not_to be_empty
				expect(json['id']).to eq(league_id)
			end

			it 'returns status code 200' do
	   			expect(response).to have_http_status(200)
	   		end
		end

		context 'when the record does not exist' do

			let(:league_id) {100}

			it 'returns status code 404' do
				expect(response).to have_http_status(404)
			end
		end
	end
end

require 'rails_helper'

RSpec.describe 'Ulmvolley API - players', type: :request do

	let!(:players) { create_list(:player, 10) }
  let(:player_id) { players.first.id }


  describe 'GET/players' do

		before { get '/players' }

		it 'returns players' do
			expect(json).not_to be_empty
			expect(json.size).to eq(10)
		end

		it 'returns status code 200' do
   			expect(response).to have_http_status(200)
		end
	end

	describe 'GET /players/:id' do

		before { get "/players/#{player_id}" }

		context 'when the record exists' do
			it 'returns the player' do
				expect(json).not_to be_empty
				expect(json['name']).not_to be_empty
			end

			it 'returns status code 200' do
	   			expect(response).to have_http_status(200)
	   		end
		end

		context 'when the record does not exist' do

			let(:player_id) {100}

			it 'returns status code 404' do
				expect(response).to have_http_status(404)
			end
		end
	end


	describe 'POST/players' do
		
		let(:valid_attributes) { { name: 'Franziska Haas', nick: 'Franzi', birthday: '01.01.2002'} }

		context 'when the request is valid' do
			before { post '/players', params: valid_attributes }

			it 'creates a player' do
				expect(json['name']).to eq('Franziska Haas')
			end

			it 'returns status code 201' do 
				expect(response).to have_http_status(201)
			end
		end

		context 'when the request is invalid' do
			before { post '/players', params: { nick: 'Franzi', birthday: '01.01.2002' } }

			it 'returns status code 422' do
				expect(response).to have_http_status(422)
			end

			it 'returns a validation failure message' do
				expect(response.body).to match(/Validation failed: Name can't be blank/)
			end
		end
	end

	
end
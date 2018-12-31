require 'rails_helper'

RSpec.describe 'ulmVolley API - attendances', type: :request do
	let!(:attendances) { create_list(:attendance, 10) }
  let(:attendance_id) { attendances.first.id }


  describe 'GET/attendances' do

		before { get '/attendances' }

		it 'returns attendances' do
			expect(json).not_to be_empty
			expect(json.size).to eq(10)
		end

		it 'returns status code 200' do
   			expect(response).to have_http_status(200)
		end
	end

	describe 'GET /attendances/:id' do

		before { get "/attendances/#{attendance_id}" }

		context 'when the record exists' do
			it 'returns the attendance' do
				expect(json).not_to be_empty
				expect(json['player_id']).to be_an_instance_of(Integer)
        expect(json['training_id']).to be_an_instance_of(Integer)
			end

			it 'returns status code 200' do
	   			expect(response).to have_http_status(200)
	   		end
		end

		context 'when the record does not exist' do

			let(:attendance_id) {100}

			it 'returns status code 404' do
				expect(response).to have_http_status(404)
			end
		end
	end


	describe 'POST/attendances' do

		context 'when the request is valid' do
			before {
        player = FactoryBot.create(:player, :with_training)
        puts player.id
        puts player.trainings.first.id
        post '/attendances', params: { player: player.id, training: player.trainings.first.id }  }

			it 'creates a attendance' do
				expect(json['player']).to eq('503')
        expect(json['training']).to eq('765')
			end

			it 'returns status code 201' do 
				expect(response).to have_http_status(201)
			end
		end

		context 'when the request is invalid' do
			before { post '/attendances', params: { nick: 'Franzi', birthday: '01.01.2002' } }

			it 'returns status code 422' do
				expect(response).to have_http_status(422)
			end

			it 'returns a validation failure message' do
				expect(response.body).to match(/Validation failed: Name can't be blank/)
			end
		end
	end

	
end
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
        post '/attendances', params: { player_id: attendances.first.player_id,
                                       training_id: attendances.second.training_id }
      }

			it 'creates a attendance' do
				expect(json['player_id']).to eq(attendances.first.player_id)
        expect(json['training_id']).to eq(attendances.second.training_id)
			end

			it 'returns status code 201' do
				expect(response).to have_http_status(201)
			end
		end

		context 'when the request is invalid since attendance already exists' do
			it 'raises an error' do
        expect {
          post '/attendances', params: { player_id: attendances.first.player_id,
                                         training_id: attendances.first.training_id }
        }.to raise_error(/UNIQUE constraint failed/)
      end
		end

    context 'when the request is invalid since player does not exist' do
      before {
        post '/attendances', params: { player_id: 12,
                                       training_id: 5 }
      }

      it 'yields a validation error' do
        expect(response.body).to match(/Player must exist/)
      end

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
    end
	end

  context 'when the request is invalid since training does not exist' do
    before {
      post '/attendances', params: { player_id: 5,
                                     training_id: 15 }
    }

    it 'yields a validation error' do
      expect(response.body).to match(/Training must exist/)
    end

    it 'returns status code 422' do
      expect(response).to have_http_status(422)
    end
  end

  context 'when the request is invalid since player and training does not exist' do
    before {
      post '/attendances', params: { player_id: 15,
                                     training_id: 15 }
    }

    it 'yields a validation error' do
      expect(response.body).to match(/must exist/)
    end

    it 'returns status code 422' do
      expect(response).to have_http_status(422)
    end
  end

  describe 'UPDATE/attendance' do
    let(:attendance_id) { attendances.first.id }
    let(:player_id) { attendances.first.player_id }
    let(:training_id) { attendances.first.training_id }
    let(:reason) { attendances.first.reason }

    context 'when the request is valid' do
      before {
        patch "/attendances/#{attendance_id}", params: {player_id: player_id,
                                                        training_id: training_id,
                                                        participant: 1,
                                                        reason: reason}
      }

      it 'returns status code 202' do
        expect(response).to have_http_status(202)
      end
    end
  end
end
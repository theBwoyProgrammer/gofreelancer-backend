require 'rails_helper'

RSpec.describe 'post request', type: :request do
  describe 'Reservations' do
    before do
      post '/api/v1/users/:user_id/reservations', params: {
        appointment_date => '2014-09-24',
        user_id => 1,
        freelancer_id => 1
      }
    end
    it 'returns the reservations\' appointment date' do
      expect(json['appointment_date']).to eq('2014-09-24')
    end
    it 'returns the reservation\' freelancer id' do
      expect(json['freelancer_id']).to eq(1)
    end

    it 'returns a created status' do
      expect(response).to have_http_status(:created)
    end
  end

  describe 'Freelancers' do
    before do
      post '/api/v1/freelancers', params: {
        name: 'Usb Bush',
        details: 'Details about this freelancer',
        photo: Faker::Internet.url,
        fee: Faker::Number.between(from: 5, to: 100),
        location: Faker::Address.full_address_as_hash(:full_address)
      }
    end

    it 'returns the freelancer\'name' do
      expect(json['name']).to eq('Usb Bush')
    end
    it 'returns the freelancer\' details' do
      expect(json['details']).to eq('Details about this freelancer')
    end

    it 'returns a created status' do
      expect(response).to have_http_status(:created)
    end
  end

  describe 'Specialization' do
    before do
      post '/api/v1/specializations', params: {
        name: 'ruby'
      }
    end

    it 'returns the freelancer\'name' do
      expect(json['name']).to eq('ruby')
    end

    it 'returns a created status' do
      expect(response).to have_http_status(:created)
    end
  end
end

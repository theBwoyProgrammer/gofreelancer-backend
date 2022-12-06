require 'rails_helper'

RSpec.describe 'post request', type: :request do
  describe 'Reservations' do
    before do
      my_user = FactoryBot.create(:user)
      @my_freelancer = FactoryBot.create(:freelancer)
      post "/api/v1/users/#{my_user.id}/reservations", params: { reservation: { appointment_date: '2014-09-24', freelancer_id: @my_freelancer.id } }
    end
    it 'returns the reservations\' appointment date' do
      expect(json['appointment_date']).to eq('2014-09-24')
    end
    it 'returns the reservation\' freelancer id' do
      expect(json['freelancer_id']).to eq(@my_freelancer.id)
    end

    it 'returns a created status' do
      expect(response).to have_http_status(:created)
    end
  end

  describe 'Freelancers' do
    describe 'Valid Input' do
      before do
        post '/api/v1/freelancers', params: { freelancer:
                                                { name: 'Usb Bush', details: 'Details about this freelancer',
                                                  photo: Faker::Internet.url,
                                                  fee: Faker::Number.between(from: 5, to: 100),
                                                  location: "DRC, Goma , Nord-Kivu"} }
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

    describe 'Invalid Input' do
      before do
        post '/api/v1/freelancers', params: { freelancer: {
          name: '',
          details: '',
          photo: 'Faker::Internet.url', # should be url
          fee: '', # should be a number,
          location: Faker::Address.full_address_as_hash(:full_address)
        }
        }
      end

      # response should have HTTP Status 422 Created
      it 'returns unprocessable_entity status' do
        expect(response).to have_http_status(422)
      end
      it 'returns name can\'t be blank' do
        expect(json.deep_symbolize_keys[:name]).to eq(['can\'t be blank'])
      end
      it 'returns details can\'t be blank' do
        expect(json.deep_symbolize_keys[:details]).to eq(['can\'t be blank'])
      end
      # no new specialization record is created
      it 'returns no new reservation record is created' do
        expect(Reservation.count).to eq(0)
      end
    end
  end

  describe 'Specialization' do
    describe 'Valid Input' do
      before do
        post '/api/v1/specializations', params: { specialization: { name: 'ruby' } }
      end

      it 'returns the freelancer\'name' do
        expect(json['name']).to eq('ruby')
      end

      it 'returns a created status' do
        expect(response).to have_http_status(:created)
      end
    end
    describe 'Invalid input' do
      before do
        post '/api/v1/specializations', params: { specialization: { name: "" } }
      end

      # response should have HTTP Status 422 Created
      it 'returns unprocessable_entity status' do
        expect(response).to have_http_status(422)
      end
      it 'returns can\'t be blank message' do
        expect(json.deep_symbolize_keys[:name]).to eq(['can\'t be blank'])
      end
      # no new specialization record is created
      it 'returns no new specialization record is created' do
        expect(Specialization.count).to eq(0)
      end
    end
  end
end

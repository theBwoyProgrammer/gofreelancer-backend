require 'rails_helper'

RSpec.describe 'Delete requests', type: :request do
  describe 'Freelancer' do
    before do
      freelancer1 = FactoryBot.create(:freelancer)
      @freelancer2 = FactoryBot.create(:freelancer)
      delete "/api/v1/freelancers/#{freelancer1.id}"
    end

    it 'response status success' do
      expect(response).to have_http_status(:no_content)
    end
    it 'should delete the freelancer' do
      expect(Freelancer.all).to eq([@freelancer2])
    end
  end
end

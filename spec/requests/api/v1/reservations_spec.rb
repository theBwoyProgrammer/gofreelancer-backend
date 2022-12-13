require 'swagger_helper'

RSpec.describe 'api/v1/reservations', type: :request do

  path '/api/v1/users/{user_id}/reservations' do
    # You'll want to customize the parameter types...
    parameter name: 'user_id', in: :path, type: :string, description: 'user_id'

    get('list reservations') do
      tags 'Reservations'
      produces 'application/json'
      response(200, 'successful') do
        let(:user_id) { FactoryBot.create(:user).id }
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   id: { type: :integer },
                   appointment_date: { type: :string, format: :datetime, example: Faker::Date.forward(days: 23) },
                   freelancer_id: { type: :integer, example: FactoryBot.create(:freelancer).id },
                   user_id: { type: :integer, example: :user_id },
                   created_at: { type: :string, format: :datetime, example: Faker::Date.backward(days: 23) },
                   updated_at: { type: :string, format: :datetime, example: Faker::Date.backward(days: 23) }
                 }
               }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
      response '404', 'user not found' do
        let(:user_id) { 'invalid' }
        run_test!
      end
    end

    post('create reservation') do
      tags 'Reservation'
      produces 'application/json'
      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :reservation, in: :body, schema: {
          type: :object,
          properties: {
            appointment_date: { type: :string, format: :datetime, example: Faker::Date.forward(days: 23) },
            freelancer_id: { type: :integer, example: FactoryBot.create(:freelancer).id }
          },
          required: %w[appointment_date freelancer_id]
        }
        let(:user_id) { FactoryBot.create(:user).id }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
      response '404', 'user not found' do
        let(:user_id) { 'invalid' }
        run_test!
      end
    end
  end

  path '/api/v1/users/{user_id}/reservations/new' do
    # You'll want to customize the parameter types...
    parameter name: 'user_id', in: :path, type: :string, description: 'user_id'
    get('new reservation') do
      tags 'Create reservation'
      produces 'application/json'
      response(200, 'successful') do
        let(:user_id) { FactoryBot.create(:user).id }
        consumes 'application/json'
        parameter name: :reservation, in: :body, schema: {
          type: :object,
          properties: {
            appointment_date: { type: :string, format: :datetime, example: Faker::Date.forward(days: 23) },
            freelancer_id: { type: :integer, example: FactoryBot.create(:freelancer).id }
          },
          required: %w[appointment_date freelancer_id]
        }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
      response '404', 'user not found' do
        let(:user_id) { 'invalid' }
        run_test!
      end
    end
  end
end

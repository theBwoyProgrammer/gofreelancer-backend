require 'swagger_helper'

RSpec.describe 'api/v1/specializations', type: :request do

  path '/api/v1/specializations' do

    get('list specializations') do
      tags 'Specializations'
      produces 'application/json'
      response(200, 'successful') do
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   id: { type: :integer },
                   name: { type: :string, example: Faker::Name.name },
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
    end

    post('create specialization') do
      tags 'Create specialization'
      produces 'application/json'
      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :specialization, in: :body, schema: {
          type: :object,
          properties: {
            name: { type: :string, example: Faker::Name.name }
          },
          required: %w[name]
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
    end
  end
end

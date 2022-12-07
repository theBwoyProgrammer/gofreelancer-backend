require 'swagger_helper'

RSpec.describe 'api/v1/specializations', type: :request do

  path '/api/v1/specializations' do

    get('list specializations') do
      response(200, 'successful') do

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
      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :specialization, in: :body, schema: {
          type: :object,
          properties: {
            name: { type: :string }
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

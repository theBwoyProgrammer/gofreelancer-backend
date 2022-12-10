require 'swagger_helper'

RSpec.describe 'api/v1/freelancers', type: :request do

  path '/api/v1/freelancers' do

    get('list freelancers') do
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

    post('create freelancer') do
      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :freelancer, in: :body, schema: {
          type: :object,
          properties: {
            name: { type: :string, example: Faker::Name.name },
            photo: { type: 'string', example: Faker::Internet.url,
                     pattern: '^https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)$' },
            details: { type: :string, example: Faker::Lorem.paragraph },
            fee: { type: 'integer', example: Faker::Number.between(from: 5, to: 100) },
            location: { type: 'string', example: Faker::Address.full_address_as_hash(:full_address) }
          },
          required: %w[name photo details fee location]
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

  path '/api/v1/freelancers/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show freelancer') do
      response(200, 'successful') do
        let(:id) { '123' }

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

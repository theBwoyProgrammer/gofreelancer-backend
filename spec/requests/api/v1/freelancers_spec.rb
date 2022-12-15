require 'swagger_helper'
RSpec.describe 'api/v1/freelancers', type: :request do
  path '/api/v1/freelancers' do
    get('list freelancers') do
      tags 'Freelancers'
      produces 'application/json'
      response(200, 'successful') do
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   id: { type: :integer },
                   name: { type: :string, example: Faker::Name.name },
                   photo: { type: 'string', example: Faker::Internet.url,
                            pattern: '^https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)$' },
                   details: { type: :string, example: Faker::Lorem.paragraph },
                   fee: { type: 'integer', example: Faker::Number.between(from: 5, to: 100) },
                   location: { type: 'string', example: Faker::Address.street_address },
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

    post('create freelancer') do
      tags 'Create freelancer'
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
            location: { type: 'string', example: Faker::Address.street_address }
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
    get('show freelancer') do
      tags 'Freelancer'
      produces 'application/json'
      parameter name: 'id', in: :path, type: :string, description: 'id', default: 1
      response(200, 'successful') do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string, example: Faker::Name.name },
                 photo: { type: 'string', example: Faker::Internet.url,
                          pattern: '^https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)$' },
                 details: { type: :string, example: Faker::Lorem.paragraph },
                 fee: { type: 'integer', example: Faker::Number.between(from: 5, to: 100) },
                 location: { type: 'string', example: Faker::Address.street_address },
                 created_at: { type: :string, format: :datetime, example: Faker::Date.backward(days: 23) },
                 updated_at: { type: :string, format: :datetime, example: Faker::Date.backward(days: 23) }
               },
               required: %w[id name photo details fee location]
        let(:id) { FactoryBot.create(:freelancer).id }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
      response '404', 'freelancer not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
    delete('delete freelancer') do
      tags 'Delete Freelancer'
      produces 'application/json'
      parameter name: 'id', in: :path, type: :string, description: 'id', default: 0
      response(200, 'successful') do
        let(:id) { FactoryBot.create(:freelancer).id }

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

require 'rails_helper'

RSpec.describe Freelancer, type: :model do
    describe 'association' do
        it 'has many users' do
            assc = described_class.reflect_on_association(:users)
            expect(assc.macro).to eq :has_many
        end

        it 'has and belongs to many specializations' do
            assc = described_class.reflect_on_association(:specializations)
            expect(assc.macro).to eq :has_and_belongs_to_many
        end
    end

    describe 'validation' do
        it 'is valid with valid attributes' do
            expect(Freelancer.new(name: 'name', photo: 'photo', details: 'details', fee: 100, location: 'location')).to be_valid
        end

        it 'is not valid without a name' do
            freelancer = Freelancer.new(name: nil)
            expect(freelancer).to_not be_valid
        end

        it 'is not valid without a photo' do
            freelancer = Freelancer.new(photo: nil)
            expect(freelancer).to_not be_valid
        end

        it 'is not valid without a details' do
            freelancer = Freelancer.new(details: nil)
            expect(freelancer).to_not be_valid
        end

        it 'is not valid without a fee' do
            freelancer = Freelancer.new(fee: nil)
            expect(freelancer).to_not be_valid
        end

        it 'is not valid without a location' do
            freelancer = Freelancer.new(location: nil)
            expect(freelancer).to_not be_valid
        end
    end

end
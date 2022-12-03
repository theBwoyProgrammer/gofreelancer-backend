require 'rails_helper'

RSpec.describe Reservation, type: :model do
    describe 'association' do
        it 'belongs to user' do
            assc = described_class.reflect_on_association(:user)
            expect(assc.macro).to eq :belongs_to
        end

        it 'belongs to freelancer' do
            assc = described_class.reflect_on_association(:freelancer)
            expect(assc.macro).to eq :belongs_to
        end
    end
    
    describe 'validation' do
        it 'has valid attributes' do
            expect
        end
    end
end
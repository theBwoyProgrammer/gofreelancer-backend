require 'rails_helper'

RSpec.describe Specialization, type: :model do
  describe 'association' do
    it 'has and belongs to many freelancers' do
      assc = described_class.reflect_on_association(:freelancers)
      expect(assc.macro).to eq :has_and_belongs_to_many
    end
  end

  describe 'validation' do
    it 'is valid with valid attributes' do
      expect(Specialization.new(name: 'Ruby on Rails')).to be_valid
    end

    it 'is not valid without a name' do
      expect(Specialization.new).to_not be_valid
    end
  end
end

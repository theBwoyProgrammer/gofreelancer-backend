require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'association' do
    it 'has many freelancers' do
      assc = described_class.reflect_on_association(:freelancers)
      expect(assc.macro).to eq :has_many
    end
  end

  describe 'validation' do
    it 'is valid with valid attributes' do
      user = User.new(name: 'John')
      expect(user).to be_valid
    end

    it 'is not valid without a name' do
      user = User.new(name: nil)
      expect(user).to_not be_valid
    end
  end
end

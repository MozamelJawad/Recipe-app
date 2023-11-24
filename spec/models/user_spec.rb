require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { User.new(name: 'Ahmad', email: 'ahmad@gmail.com') }

  describe 'Validation' do
    it 'should have a name' do
      expect(user.name).to eq('Ahmad')
    end

    it 'should have a email address' do
      expect(user.email).to eq('ahmad@gmail.com')
    end

    it 'is not valid without email' do
      expect(User.create(name: 'Tom')).to_not be_valid
    end
  end
end

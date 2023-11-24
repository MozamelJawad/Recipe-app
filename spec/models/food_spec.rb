require 'rails_helper'

RSpec.describe Food, type: :model do
  describe 'validation' do
    before :all do
      @user = User.create(name: 'Ahmad', email: 'ahmad@gmail.com')
      @food = Food.create(name: 'Apple', measurement_unit: 'Kg', price: 200, quantity: 7, user_id: @user.id)
    end

    it 'should valiate presence of name' do
      expect(@food.name).to eq('Apple')
    end

    it 'should valiate presence of measurement_unit' do
      expect(@food.measurement_unit).to eq('Kg')
    end

    it 'should valiate presence of price' do
      expect(@food.price).to eq(200)
    end

    it 'should valiate presence of quantity' do
      expect(@food.quantity).to eq(7)
    end

    it 'should valiate association of user_id' do
      expect(@food.user_id).to eq(@user.id)
    end
  end
end

require 'rails_helper'

RSpec.describe Recipe, type: :model do
  subject(:user) { User.new(name: 'Ahmad', email: 'ahmad@gmail.com') }

  let!(:recipe) do
    Recipe.create(name: 'Recipe', description: 'Recipe 1', public: true, preparation_time: 3,
                  cooking_time: 2, user_id: user.id)
  end

  describe 'Validation' do
    it 'should have a description' do
      expect(recipe.description).to eq('Recipe 1')
    end

    it 'should have a name' do
      expect(recipe.name).to eq('Recipe')
    end

    it 'should have a public' do
      expect(recipe.public).to eq(true)
    end

    it 'should have a prepartion time' do
      expect(recipe.preparation_time).to eq(3)
    end

    it 'should have a cooking time' do
      expect(recipe.cooking_time).to eq(2)
    end

    it 'should valiate association of user_id' do
      expect(recipe.user_id).to eq(user.id)
    end
  end
end

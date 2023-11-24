require 'rails_helper'

RSpec.describe 'Food', type: :feature do
  before(:each) do
    @user = User.create(name: 'new', email: 'new@gmail.com', password: '123123',
                        password_confirmation: '1234567890')
    @recipe = Recipe.create(name: 'Pizza', preparation_time: 2, cooking_time: 3, description: 'best pizza',
                            public: true, user_id: @user.id)
    @food = Food.create(name: 'Apple', measurement_unit: 'Kg', price: 10, quantity: 15, user_id: @user.id)
    @recipe_food = RecipeFood.create(quantity: 20, food_id: @food.id, recipe_id: @recipe.id)

    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
  end

  describe 'Test for food page' do
    it 'create new food' do
      visit new_food_path
      fill_in 'Name', with: 'Orange'
      fill_in 'Measurement unit', with: 'grams'
      fill_in 'Price', with: 11
      fill_in 'Quantity', with: 20
      click_button 'Create Food'
      expect(page).to have_content('Orange')
    end

    it 'have food contents' do
      visit foods_path
      expect(page).to have_content('Apple')
      expect(page).to have_content('Kg')
      expect(page).to have_content(10)
      expect(page).to have_content('Delete')
    end

    it 'have a delete button' do
      visit foods_path
      expect(page).to have_content('Delete')
    end

    it 'have a edit button' do
      visit foods_path
      expect(page).to have_content('Edit')
    end
  end
end

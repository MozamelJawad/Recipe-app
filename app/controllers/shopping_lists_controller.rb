class ShoppingListsController < ApplicationController
  def index
    # Get all the foods of the current user
    @foods = current_user.foods

    # For each recipe of the current user, update the quantity of the foods
    current_user.recipes.map do |recipe|
      recipe.recipe_foods.includes(:food).map do |recipe_food|
        food = recipe_food.food
        selected_food = @foods.select { |f| f.name == food.name }[0]
        selected_food.quantity = selected_food.quantity - recipe_food.quantity
      end
    end

    # Select only the foods with negative quantity
    @foods = @foods.select { |food| food.quantity.negative? }

    # Invert the quantity of the selected foods
    @foods.each { |food| food.quantity *= -1 }

    # Calculate the total price of the selected foods
    @total = 0
    @foods.each do |food|
      @total += (food.price * food.quantity)
    end
  end
end

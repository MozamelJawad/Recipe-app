class ShoppingListsController < ApplicationController
    include ShoppingListsHelper
  
    def index
      @recipes = Recipe.find(params[:recipe_id])
      @total_foods_value = calc_food
    end

    private

    def calc_food
      @food = Food.find(params[:name])
      @
    end
  end
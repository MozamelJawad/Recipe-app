class RecipeFoodsController < ApplicationController
  def new
    @recipe_food = RecipeFood.new
  end

  def create
    @recipe_food = RecipeFood.new(recipe_food_params)
    @recipe_food.recipe_id = params[:recipe_id]
    if @recipe_food.save
      redirect_to recipe_path(params[:recipe_id]), notice: 'Food ingredient was successfully added.'
    else
      render :new
    end
  end

  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.destroy

    redirect_to recipe_path(params[:recipe_id]), notice: 'Food ingredient was successfully eliminated.'
  end

  def edit
    @recipe_food = RecipeFood.find(params[:id])
  end

  def update
    @recipe_food = RecipeFood.find(params[:id])
    if @recipe_food.update(recipe_food_params)
      redirect_to recipe_path(params[:recipe_id]), notice: 'Food ingredient was successfully updated.'
    else
      render :edit
    end
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:food_id, :quantity)
  end
end

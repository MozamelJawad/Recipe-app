class RecipesController < ApplicationController
  def index
    @recipes = current_user.recipes
  end

  def new
    @recipe = Recipe.new
    @user = current_user
  end

  def create
    @recipes = current_user.recipes.build(recipe_params)

    if @recipes.save
      redirect_to recipes_path, notice: 'Food was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    redirect_to recipes_path, notice: 'Recipe eliminated successfully.'
  end

  def show
    @recipes = Recipes.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end

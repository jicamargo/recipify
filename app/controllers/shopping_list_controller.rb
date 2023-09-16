# app/controllers/shopping_list_controller.rb
class ShoppingListController < ApplicationController
  def index
    @user = current_user
    @missing_foods = calculate_missing_foods(@user)
    @total_price = calculate_total_price(@missing_foods)
  end

  private

  def calculate_missing_foods(user)
    # Get all recipes of the user
    user_recipes = user.recipes.includes(:recipe_foods)

    # Initialize a hash to track the missing foods and their required quantities
    missing_foods = Hash.new(0)

    # Group recipe_foods by food_id and calculate the total required quantity
    required_quantity_by_food_id = calculate_required_quantity(user_recipes)

    # Get the user's foods with recipe_foods
    user_foods = user.foods

    # Compare the total required quantity with the quantity in foods
    calculate_missing_and_store(user_foods, required_quantity_by_food_id, missing_foods)

    # Convert the hash to an array of missing foods with their missing quantities
    missing_foods.map { |food, missing_quantity| { food:, missing_quantity: } }
  end

  def calculate_required_quantity(user_recipes)
    required_quantity_by_food_id = Hash.new(0)
    user_recipes.each do |recipe|
      recipe.recipe_foods.each do |recipe_food|
        required_quantity_by_food_id[recipe_food.food_id] += recipe_food.quantity
      end
    end
    required_quantity_by_food_id
  end

  def calculate_missing_and_store(user_foods, required_quantity_by_food_id, missing_foods)
    required_quantity_by_food_id.each do |food_id, required_quantity|
      food = user_foods.find { |user_food| user_food.id == food_id }
      next unless food && food.quantity < required_quantity

      missing_quantity = required_quantity - food.quantity

      puts "You have #{food.quantity} #{food.name} but you need #{required_quantity}"

      # Add the missing food and its missing quantity to the hash
      missing_foods[food] += missing_quantity
    end
  end

  def calculate_total_price(missing_foods)
    total_price = 0

    missing_foods.each do |missing_food|
      food = missing_food[:food]
      missing_quantity = missing_food[:missing_quantity]
      total_price += food.price * missing_quantity
    end

    total_price
  end
end

require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  it 'is valid with valid attributes' do
    user = User.create(
      name: 'John Doe',
      email: 'john@example.com',
      password: 'password'
    )

    food = Food.create(
      name: 'Example Food',
      measurement_unit: 'grams',
      price: 10.99,
      quantity: 100,
      user:
    )

    recipe = Recipe.create(
      name: 'Example Recipe',
      preparation_time: 30,
      cooking_time: 60,
      description: 'A delicious recipe.',
      user:
    )

    recipe_food = RecipeFood.new(
      recipe:,
      food:,
      quantity: 2
    )

    expect(recipe_food).to be_valid
  end

  it 'is not valid without a quantity' do
    recipe_food = RecipeFood.new(
      quantity: nil
    )

    expect(recipe_food).to_not be_valid
  end

  it 'is not valid with a negative quantity' do
    recipe_food = RecipeFood.new(
      quantity: -1
    )

    expect(recipe_food).to_not be_valid
  end
end

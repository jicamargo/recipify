require 'rails_helper'

RSpec.describe Recipe, type: :model do
  it 'is valid with valid attributes' do
    user = User.create(
      name: 'John Doe',
      email: 'john@example.com',
      password: 'password'
    )

    recipe = Recipe.new(
      name: 'Example Recipe',
      preparation_time: 30,
      cooking_time: 60,
      description: 'A delicious recipe.',
      user:
    )

    expect(recipe).to be_valid
  end

  it 'is not valid without a name' do
    recipe = Recipe.new(
      preparation_time: 30,
      cooking_time: 60,
      description: 'A delicious recipe.'
    )

    expect(recipe).to_not be_valid
  end

  it 'is not valid without preparation time' do
    recipe = Recipe.new(
      name: 'Example Recipe',
      cooking_time: 60,
      description: 'A delicious recipe.'
    )

    expect(recipe).to_not be_valid
  end

  it 'is not valid without cooking time' do
    recipe = Recipe.new(
      name: 'Example Recipe',
      preparation_time: 30,
      description: 'A delicious recipe.'
    )

    expect(recipe).to_not be_valid
  end

  it 'is not valid without a description' do
    recipe = Recipe.new(
      name: 'Example Recipe',
      preparation_time: 30,
      cooking_time: 60
    )

    expect(recipe).to_not be_valid
  end
end

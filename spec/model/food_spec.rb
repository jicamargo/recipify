require 'rails_helper'

RSpec.describe Food, type: :model do
  it 'is valid with valid attributes' do
    user = User.create(
      name: 'John Doe',
      email: 'john@example.com',
      password: 'password'
    )

    food = Food.new(
      name: 'Example Food',
      measurement_unit: 'Unit',
      price: 10.99,
      quantity: 5,
      user:
    )

    expect(food).to be_valid
  end

  it 'is not valid without a name' do
    food = Food.new(
      measurement_unit: 'Unit',
      price: 10.99,
      quantity: 5
    )

    expect(food).to_not be_valid
  end

  it 'is not valid without a measurement_unit' do
    food = Food.new(
      name: 'Example Food',
      price: 10.99,
      quantity: 5
    )

    expect(food).to_not be_valid
  end

  it 'is not valid without a price' do
    food = Food.new(
      name: 'Example Food',
      measurement_unit: 'Unit',
      quantity: 5
    )

    expect(food).to_not be_valid
  end

  it 'is not valid without a quantity' do
    food = Food.new(
      name: 'Example Food',
      measurement_unit: 'Unit',
      price: 10.99
    )

    expect(food).to_not be_valid
  end
end

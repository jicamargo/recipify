# general functions for integration tests

def login(email, password)
  visit '/users/sign_in'
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  click_button 'Log in'
end

def add_info_to_db
  let!(:user) do
    User.create(
      name: 'Test User',
      email: 'test@example.com',
      password: '123456'
    )
  end

  let!(:food1) do
    Food.create(
      name: 'Food 1',
      measurement_unit: 'Grams',
      price: 5.99,
      quantity: 10,
      user:
    )
  end

  let!(:food2) do
    Food.create(
      name: 'Food 2',
      measurement_unit: 'Pieces',
      price: 2.49,
      quantity: 20,
      user:
    )
  end

  let!(:recipe) do
    Recipe.create(
      name: 'Test Recipe',
      preparation_time: 30,
      cooking_time: 45,
      description: 'This is a test recipe.',
      public: true,
      user:
    )
  end

  let!(:recipe_food1) do
    RecipeFood.create(
      quantity: 100,
      recipe:,
      food: food1
    )
  end

  let!(:recipe_food2) do
    RecipeFood.create(
      quantity: 100,
      recipe:,
      food: food2
    )
  end
end

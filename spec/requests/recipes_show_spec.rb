require 'rails_helper'
require_relative 'test_helper'

RSpec.describe 'Recipe Show Page', type: :system do
  # Add necessary data to the database with the test helper method
  add_info_to_db

  scenario 'User can view details of a recipe' do
    login(user.email, user.password)
    sleep(1)

    # Visit the recipe show page, replace ':id' with the actual recipe ID
    visit recipe_path(recipe)

    # Assertions to check if the expected content is present on the page
    expect(page).to have_content(recipe.name)
    expect(page).to have_content("Preparation time: #{recipe.preparation_time}")
    expect(page).to have_content("Cooking Time: #{recipe.cooking_time}")
    expect(page).to have_content("Instructions: #{recipe.description}")
    expect(page).to have_button('Generate shopping list')
    expect(page).to have_button('Add ingredient')
  end

  scenario 'User can modify recipe details if allowed' do
    login(user.email, user.password)
    sleep(1)

    visit recipe_path(recipe)

    expect(page).to have_button('Modify')
    expect(page).to have_button('Remove')

    first('button', text: 'Modify').click
    expect(current_path).to eq(edit_recipe_food_path(recipe_food1))
  end
end

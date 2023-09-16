require 'rails_helper'
require_relative 'test_helper'

RSpec.describe 'Recipes Index Page', type: :system do
  add_info_to_db

  scenario 'User can see the list of recipes' do
    login(user.email, user.password)
    sleep(1)
    visit '/recipes'
    expect(page).to have_content('Recipes')
    expect(page).to have_button('New recipe')
    expect(page).to have_content('This is a test recipe.')
  end

  scenario 'User can click "New recipe" and be redirected to the new recipe page' do
    login(user.email, user.password)
    sleep(1)
    visit recipes_path
    click_button('New recipe')

    expect(current_path).to eq(new_recipe_path)
  end
end

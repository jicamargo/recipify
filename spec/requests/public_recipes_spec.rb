require 'rails_helper'
require_relative 'test_helper'

RSpec.describe 'Recipes Index Page', type: :system do
  add_info_to_db

  scenario 'User can see the list of recipes' do
    login(user.email, user.password)
    sleep(1)
    visit '/recipes_public'

    expect(page).to have_content('Public Recipes')
    expect(page).to have_content('Test Recipe')
    expect(page).to have_content('By: Test User')
  end
end

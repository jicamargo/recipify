require 'rails_helper'
require_relative 'test_helper'

RSpec.describe 'Foods Index Page', type: :system do
  add_info_to_db

  describe 'the signin process', type: :feature do
    it "signs not me in, because I don't have a valid email" do
      login('wrong@example.com', 'badpassword')
      expect(page).to have_content 'Invalid'
    end

    it 'signs me in' do
      login(user.email, user.password)
      expect(page).to have_content 'Recipify' # Name of the app at the top (navbar)
    end
  end

  scenario 'User can see the list of foods' do
    login(user.email, user.password)
    sleep(1)
    visit foods_path
    expect(page).to have_content('Foods')
    expect(page).to have_content('Add Food')
    expect(page).to have_content('Food 1')
    expect(page).to have_content('Grams')
    expect(page).to have_content('$5.99')
    expect(page).to have_content('Food 2')
    expect(page).to have_content('Pieces')
    expect(page).to have_content('$2.49')
  end

  scenario 'User can click "Add Food" and be redirected to the new food page' do
    login(user.email, user.password)
    sleep(1)
    visit foods_path
    click_link('Add Food')
    expect(current_path).to eq(new_food_path)
  end
end

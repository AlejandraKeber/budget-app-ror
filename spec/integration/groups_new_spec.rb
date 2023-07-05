require 'rails_helper'

RSpec.describe 'Groups New', type: :feature do
  before(:each) do
    @user = User.create!(name: 'User Test', email: 'test@test.com', password: '123456')
    @user.save!

    login_as(@user)
    visit new_group_path
  end

  describe 'GET /groups/new' do
    it 'has the correct title' do
      expect(page).to have_content('ADD A NEW CATEGORY')
    end

    it 'has the correct fields' do
      expect(page).to have_field('Enter category name')
      expect(page).to have_field('Enter URL icon')
    end

    it 'has the correct buttons' do
      expect(page).to have_button('ADD CATEGORY')
    end
  end
end

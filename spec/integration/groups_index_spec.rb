require 'rails_helper'

RSpec.describe 'Groups index page', type: :feature do
  before(:each) do
    @user = User.create!(name: 'User Test', email: 'test@test.com', password: '123456')
    @group = Group.create!(name: 'Test Group', icon: 'test.png', user_id: @user.id)
    @user.save!

    login_as(@user)
    visit groups_path
  end

  it 'displays the group name' do
    expect(page).to have_text(@group.name)
  end

  it 'displays the group icon' do
    expect(page).to have_css("img[src*='test.png']")
  end
end
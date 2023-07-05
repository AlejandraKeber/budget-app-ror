require 'rails_helper'

RSpec.describe 'Payments New', type: :feature do
    before(:each) do
      @user = User.create!(name: 'User Test', email: 'test@test.com', password: '123456')
      @group = Group.create!(name: 'Test Group', icon: 'test.png', user_id: @user.id)
      @user.save!
  
      login_as(@user)
      visit new_group_payment_path(@group)
    end

  describe 'GET /payments/new' do
    it 'has the correct title' do
      expect(page).to have_content('ADD A NEW PAYMENT')
    end

    it 'has the correct fields' do
      expect(page).to have_field('Enter payment name')
      expect(page).to have_field('Enter payment amount')
    end

    it 'has the correct buttons' do
      expect(page).to have_button('ADD PAYMENT')
    end
  end
end
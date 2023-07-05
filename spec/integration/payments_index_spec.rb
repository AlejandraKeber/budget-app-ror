require 'rails_helper'

RSpec.describe 'Payments index page', type: :feature do
  before(:each) do
    @user = User.create!(name: 'User Test', email: 'test@test.com', password: '123456')
    @group = Group.create!(name: 'Test Group', icon: 'test.png', user_id: @user.id)
    @payment = Payment.create!(name: 'Test Payment', amount: 100, author_id: @user.id, group_ids: [@group.id])
    @user.save!

    login_as(@user)
    visit group_payments_path(@group)
  end

  it 'displays the title' do
    expect(page).to have_text('PAYMENTS')
  end
  
  it 'displays the payment name' do
    expect(page).to have_text(@payment.name)
  end

  it 'displays the payment amount' do
    expect(page).to have_text(@payment.amount)
  end
end
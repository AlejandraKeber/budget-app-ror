require 'rails_helper'

RSpec.describe Payment, type: :model do
  let(:user) { User.create(name: 'Test User', email: 'test@gmail.com') }
  let(:group) { Group.create(name: 'Test Group', icon: 'group-icon', user:) }
  subject { Payment.create(name: 'Test Payment', amount: 10, author_id: user.id, groups: [group]) }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'name should not be too long' do
    subject.name = 'a' * 51
    expect(subject).to_not be_valid
  end

  it 'amount must be a number' do
    subject.amount = 'abc'
    expect(subject).to_not be_valid
  end

  it 'group quantity must not be blank' do
    subject.groups = []
    expect(subject).to_not be_valid
  end
end

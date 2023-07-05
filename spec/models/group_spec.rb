require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:user) { User.create(name: 'Test User', email: 'test@gmail.com') }
  subject { Group.create(name: 'Test Group', icon: 'group-icon', user: user) }

  before { subject.save}

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'icon should be present' do
    subject.icon = nil
    expect(subject).to_not be_valid
  end

  it 'name should not be too long' do
    subject.name = 'a' * 51
    expect(subject).to_not be_valid
  end  
end

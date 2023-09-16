require 'rails_helper'

RSpec.describe User, type: :model do
  it 'name should be present' do
    user = User.new(name: 'John Doe', email: 'john@example.com', password: 'password')
    expect(user).to be_valid

    user.name = nil
    expect(user).to_not be_valid
  end
end

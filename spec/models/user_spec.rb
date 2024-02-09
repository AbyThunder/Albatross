# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  let(:user) do
    create(:user, first_name: 'John', last_name: 'Doe', email: 'john.doe@example.com', phone: '+48123456789',
                  password: 'password', password_confirmation: 'password')
  end

  it 'is valid with valid attributes' do
    expect(user).to be_valid
  end

  it 'is not valid with a first name longer than 50 characters' do
    user.first_name = 'a' * 51
    expect(user).not_to be_valid
  end

  it 'is not valid with a last name longer than 50 characters' do
    user.last_name = 'a' * 51
    expect(user).not_to be_valid
  end

  it 'is not valid with an improperly formatted phone number' do
    user.phone = '12345'
    expect(user).not_to be_valid
  end

  it 'accepts a valid Polish phone number without the country code' do
    user.phone = '123456789'
    expect(user).to be_valid
  end
end

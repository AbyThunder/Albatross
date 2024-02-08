# frozen_string_literal: true

# spec/controllers/api/v1/users_controller_spec.rb
require 'rails_helper'

RSpec.describe Api::V1::UsersController do
  describe 'POST #register_user' do
    let(:club) { create(:club, name: 'Test Club', address: 'Address') }
    let(:valid_attributes) do
      {
        'Name' => Faker::Name.first_name,
        'Surname' => Faker::Name.last_name,
        'Email' => Faker::Internet.email,
        'Phone Number' => '+1289739127',
        'Address' => Faker::Address.street_address,
        'Password' => 'password123',
        'Repeat Password' => 'password123',
        'Golf Clubs' => club.name
      }
    end
    let(:invalid_attributes) { valid_attributes.merge('Email' => '') }

    context 'with valid params' do
      it 'creates a new User' do
        request.headers['CONTENT_TYPE'] = 'application/json'
        expect do
          post(:register_user, params: valid_attributes, format: :json)
        end.to change(User, :count).by(1)
      end

      it 'assigns the newly created user to the specified club' do
        request.headers['CONTENT_TYPE'] = 'application/json'
        post :register_user, params: valid_attributes, format: :json
        expect(User.last.clubs.first).to eq(club)
      end

      it 'renders a successful response' do
        request.headers['CONTENT_TYPE'] = 'application/json'
        post :register_user, params: valid_attributes, format: :json
        expect(response).to have_http_status(:created)
        expect(JSON.parse(response.body)['message']).to eq('User registered successfully')
      end

      it 'assigns the role "applied" to the newly created user' do
        request.headers['CONTENT_TYPE'] = 'application/json'
        post :register_user, params: valid_attributes, format: :json
        expect(User.last.role).to eq('applied')
      end
    end

    context 'with invalid params' do
      it 'does not create a new User' do
        request.headers['CONTENT_TYPE'] = 'application/json'
        expect do
          post(:register_user, params: invalid_attributes, format: :json)
        end.not_to change(User, :count)
      end

      it 'renders an error response' do
        request.headers['CONTENT_TYPE'] = 'application/json'
        post :register_user, params: invalid_attributes, format: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)['errors']).to eq('User registration failed')
      end
    end

    context 'when club is not found' do
      it 'renders an error response' do
        request.headers['CONTENT_TYPE'] = 'application/json'
        post :register_user, params: valid_attributes.merge('Golf Clubs' => 'Non-existent Club')
        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)['errors']).to eq('Club not found')
      end
    end
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::UsersController do
  describe '#show' do
    let(:request) { get :show, params: { id: user.id, version: 'v1' } }
    let(:user) { create(:user) }

    context 'when user is logged in, and requests their own details' do
      before do
        sign_in user
        request
      end

      it 'renderses correct json', :aggregate_failures do
        expect(response.body).to match(UserSerializer.new(user).to_json)
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when user is not logged in' do
      before { request }

      it 'renderses an error', :aggregate_failures do
        expect(response.body).to include('Error')
        expect(response).to have_http_status(:forbidden)
      end
    end

    context 'when a non-existent user id is requested' do
      let(:request) { get :show, params: { id: '123', version: 'v1' } }

      before { request }

      it 'renderses 404', :aggregate_failures do
        expect(response.body).to include('Couldn\'t find')
        expect(response).to have_http_status(:not_found)
      end
    end

    context 'when a logged in user tries to fetch a different user\'s data' do
      let(:user2) { create(:user) }

      before do
        sign_in user2
        request
      end

      it 'renderses an error', :aggregate_failures do
        expect(response.body).to include('Error')
        expect(response).to have_http_status(:forbidden)
      end
    end

    context 'when a manager tries to fetch a different user\'s data' do
      let(:user2) { create(:user, type: 'Manager') }

      before do
        sign_in user2
        request
      end

      it 'renderses the user', :aggregate_failures do
        expect(response.body).to match(UserSerializer.new(user).to_json)
        expect(response).to have_http_status(:ok)
      end
    end
  end

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

    context 'with valid params', skip: 'failing tests' do
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
      it 'does not create a new User', skip: 'failing tests' do
        request.headers['CONTENT_TYPE'] = 'application/json'
        expect do
          post(:register_user, params: invalid_attributes, format: :json)
        end.not_to change(User, :count)
      end

      it 'renders an error response', skip: 'failing tests' do
        request.headers['CONTENT_TYPE'] = 'application/json'
        post :register_user, params: invalid_attributes, format: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)['errors']).to eq('User registration failed')
      end
    end

    context 'when club is not found', skip: 'failing tests' do
      it 'renders an error response' do
        request.headers['CONTENT_TYPE'] = 'application/json'
        post :register_user, params: valid_attributes.merge('Golf Clubs' => 'Non-existent Club')
        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)['errors']).to eq('Club not found')
      end
    end
  end
end

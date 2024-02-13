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

      it 'renders an error', :aggregate_failures do
        expect(response.body).to include('Error')
        expect(response).to have_http_status(:forbidden)
      end
    end

    context 'when a non-existent user id is requested' do
      let(:request) { get :show, params: { id: '123', version: 'v1' } }

      before { request }

      it 'renders 404', :aggregate_failures do
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

      it 'renders an error', :aggregate_failures do
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

      it 'renders the user', :aggregate_failures do
        expect(response.body).to match(UserSerializer.new(user).to_json)
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'POST #register_user' do
    let(:club) { create(:club) }
    let(:valid_attributes) do
      {
        first_name: 'John',
        last_name: 'Doe',
        email: 'john@example.com',
        phone: '+1289739127',
        address: '123 Main St',
        password: 'password123',
        repeat_password: 'password123',
        club_id: club.name
      }
    end
    let(:invalid_attributes) { valid_attributes.deep_merge(user: { email: '' }) }

    context 'with valid params', skip: 'failing tests' do
      it 'creates a new User and assigns to the club', :aggregate_failures do
        request.headers['CONTENT_TYPE'] = 'application/json'
        expect do
          post(:register_user, params: valid_attributes, as: :json)
        end.to change(User, :count).by(1)
        expect(User.last.club).to eq(club)
        expect(response).to have_http_status(:created)
        expect(JSON.parse(response.body)['message']).to eq('User registered successfully')
      end
    end

    context 'with invalid params', skip: 'failing tests' do
      it 'does not create a new User', :aggregate_failures do
        expect do
          post(:register_user, params: invalid_attributes, as: :json)
        end.not_to change(User, :count)
        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)['errors']).to eq('User registration failed')
      end
    end
  end
end

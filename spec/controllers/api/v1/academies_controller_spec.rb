# # frozen_string_literal: true

# require 'rails_helper'

# RSpec.describe Api::V1::AcademiesController do
#   describe 'POST #create with sponsors' do
#     context 'with valid academy and sponsors parameters' do
#       let(:valid_params_with_sponsors) do
#         {
#           name: 'Academy with Sponsors',
#           season: '2025 Summer',
#           edition_number: '3',
#           package: 'Premium Package',
#           sponsors: [
#             { name: 'Sponsor One', image_url: 'http://example.com/sponsor1.jpg', description: 'First Sponsor' },
#             { name: 'Sponsor Two', image_url: 'http://example.com/sponsor2.jpg', description: 'Second Sponsor' }
#           ]
#         }
#       end

#       it 'creates a new academy and associated sponsors' do
#         expect do
#           post(:create, params: valid_params_with_sponsors)
#         end.to change(Academy, :count).by(1).and change(AcademySponsor, :count).by(2)

#         academy = Academy.last
#         expect(response).to have_http_status(:created)
#         expect(academy.academy_sponsors.count).to eq(2)
#         expect(academy.academy_sponsors.pluck(:name)).to include('Sponsor One', 'Sponsor Two')
#       end
#     end
#   end

#   describe 'PATCH #update with sponsors' do
#     let(:academy) { create(:academy) }
#     let!(:existing_sponsor) { create(:academy_sponsor, academy: academy, name: 'Existing Sponsor') }

#     context 'when updating academy and adding a new sponsor' do
#       let(:update_params_with_new_sponsor) do
#         {
#           id: academy.id,
#           name: 'Updated Academy Name',
#           sponsors: [
#             { name: 'New Sponsor', image_url: 'http://example.com/new_sponsor.jpg', description: 'A new sponsor' }
#           ]
#         }
#       end

#       it 'updates the academy and adds a new sponsor without removing existing ones' do
#         expect do
#           patch(:update, params: update_params_with_new_sponsor)
#         end.not_to(change(Academy, :count)
#           .and(change(AcademySponsor, :count).by(1)))

#         academy.reload
#         expect(response).to have_http_status(:ok)
#         expect(academy.name).to eq('Updated Academy Name')
#         expect(academy.academy_sponsors.count).to eq(2) # Includes the existing and new sponsor
#         expect(academy.academy_sponsors.pluck(:name)).to include('Existing Sponsor', 'New Sponsor')
#       end
#     end

#     context 'when updating sponsors of an academy' do
#       let(:update_params_with_sponsor_update) do
#         {
#           id: academy.id,
#           sponsors: [
#             { id: existing_sponsor.id, name: 'Updated Sponsor', description: 'Updated description' }
#           ]
#         }
#       end

#       it "updates the existing sponsor's details" do
#         patch :update, params: update_params_with_sponsor_update
#         existing_sponsor.reload

#         expect(response).to have_http_status(:ok)
#         expect(existing_sponsor.name).to eq('Updated Sponsor')
#         expect(existing_sponsor.description).to eq('Updated description')
#       end
#     end
#   end

#   # Note: Adjust the parameters and expectations based on your actual implementation details.
# end

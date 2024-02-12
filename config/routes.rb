# frozen_string_literal: true

Dir.glob('config/routes/v*').each do |version_routes|
  require Rails.root.join(version_routes)
end

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users

  scope '(:locale)', locale: /en|pl/ do
    namespace :api, constraints: { format: 'json' } do
      scope ':version', version: /v1/ do
        extend Routes::V1
      end
    end
  end
end

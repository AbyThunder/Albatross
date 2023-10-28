Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*' # Replace this with the actual origin of your MAUI app
    resource '*',
             headers: :any,
             methods: [:get, :post, :put, :patch, :delete, :options, :head],
             credentials: false # change to true in prod
  end
end

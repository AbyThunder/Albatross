Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'https://albatrossgolf.azurewebsites.net' # Replace this with the actual origin of your MAUI app
    resource '*',
             headers: :any,
             methods: [:get, :post, :put, :patch, :delete, :options, :head],
             credentials: true, # change to true in prod
             expose: ['access-token', 'expiry', 'token-type', 'uid', 'client']
  end
end

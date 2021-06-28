require "sinatra"
require 'sinatra/activerecord'
require 'sinatra/contrib'
require './config/environments'
require 'json'
require 'geocoder'

require_relative './app/controllers/drivers_controller'
require_relative './app/controllers/riders_controller'
require_relative './app/controllers/ride_services_controller'
require_relative './app/controllers/application_controller'
require_relative './app/models/driver'
require_relative './app/models/rider'
require_relative './app/models/ride_services'


before do
  content_type :json
end

namespace '/v1' do
  get '/' do
    'Test de prueba'
  end
end

namespace '/v1' do
  get '/drivers' do
    drivers = DriversController.drivers
    drivers
  end
end

namespace '/v1' do
  get '/drivers/:id' do
    driver = DriversController.driver(params['id'])
    driver
  end
end

namespace '/v1' do
  get '/riders' do
      riders = RidersController.riders
      riders
  end
end

namespace '/v1' do
  get '/riders/:id' do
    rider = RidersController.rider(params['id'])
    rider
  end
end

namespace '/v1' do
  get '/ride_services/:rider_email/:final_latitude/:final_longitude' do
    ride_service = RideServicesController.ride_service(params['rider_email'], params['final_latitude'], params['final_longitude'])
    ride_service.to_json
  end
end

namespace '/v1' do
  get '/geocoder_example' do
    geocoder_example = RideServicesController.geocoder_example
    geocoder_example
  end
end

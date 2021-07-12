require "sinatra"
require 'sinatra/activerecord'
require 'sinatra/contrib'
require './config/environments'
require 'json'
require 'geocoder'
require 'httparty'

require_relative './app/controllers/drivers_controller'
require_relative './app/controllers/riders_controller'
require_relative './app/controllers/ride_services_controller'
require_relative './app/controllers/payment_methods_controller'
require_relative './app/controllers/transactions_controller'
require_relative './app/controllers/application_controller'
require_relative './app/models/driver'
require_relative './app/models/rider'
require_relative './app/models/ride_services'
require_relative './app/models/payment_method'
require_relative './app/models/transaction'


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


namespace '/v1' do
  # Token Card
  get '/riders/:id/token-card' do
    rider = Rider.find(params[:id])
    response = HTTParty.post('https://sandbox.wompi.co/v1/tokens/cards',
      :body => {
        "number": "4242424242424242",
        "cvc": "789",
        "exp_month": "12",
        "exp_year": "29",
        "card_holder": "Juliana Vargas"
      }.to_json,
      :headers => { 'Authorization' => 'Bearer pub_test_VOQh65XWeFmEepm0lKqQiHRZSxMruXTM' }
    )
    rider.token = response.parsed_response["data"]["id"]
    rider.save
    response.body
  end
end

namespace '/v1' do
  get '/riders/:id/acceptance-token' do
    rider = Rider.find(params[:id])
    response = HTTParty.get('https://sandbox.wompi.co/v1/merchants/pub_test_VOQh65XWeFmEepm0lKqQiHRZSxMruXTM')
    rider.acceptance_token = response.parsed_response["data"]["presigned_acceptance"]["acceptance_token"]
    rider.save
    response.body
  end
end

namespace '/v1' do
  # Payment Sources
  get '/riders/:id/payment-sources' do
    rider = Rider.find(params[:id])
    response_acceptance_token = HTTParty.get('https://sandbox.wompi.co/v1/merchants/pub_test_VOQh65XWeFmEepm0lKqQiHRZSxMruXTM')
    rider.acceptance_token = response_acceptance_token.parsed_response["data"]["presigned_acceptance"]["acceptance_token"]

    response = HTTParty.post('https://sandbox.wompi.co/v1/payment_sources',
      :body => {
        "type": rider.payment_method,
        "token": rider.token,
        "customer_email": rider.email,
        "acceptance_token": rider.acceptance_token
      }.to_json,
      :headers => { 'Authorization' => 'Bearer prv_test_IL8OmjsXYgF2tH64xLdMWeWM5UiB8v3S
        ' }
      )
      payment_method = PaymentMethod.create(
        payment_source_id: response.parsed_response["data"]["id"],
        status: response.parsed_response["status"],
        method: rider.payment_method
      )
      rider.payment_method_id = payment_method.id
      rider.save
      response.body
  end
end

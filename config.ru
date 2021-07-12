require './app'
require 'sinatra'

require_relative './app/controllers/application_controller'
require_relative './app/controllers/riders_controller'
require_relative './app/controllers/drivers_controller'
require_relative './app/controllers/ride_services_controller'
require_relative './app/controllers/payment_methods_controller'
require_relative './app/controllers/transactions_controller'

use RidersController
use DriversController
use RideServicesController
use PaymentMethodsController
use TransactionsController
run ApplicationController

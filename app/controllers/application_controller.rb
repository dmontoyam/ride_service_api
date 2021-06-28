class ApplicationController < Sinatra::Base
  require 'sinatra'

  get '/' do
    "Test run application"
  end
end

class DriversController < Sinatra::Base
  extend Geocoder::Model::ActiveRecord

  def self.drivers
    return Driver.drivers
  end

  def self.driver(id)
    return Driver.driver(id)
  end

end

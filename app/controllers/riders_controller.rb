class RidersController < Sinatra::Base
  extend Geocoder::Model::ActiveRecord

  def self.riders
    return Rider.riders
  end

  def self.rider(id)
      return Rider.rider(id)
  end
end

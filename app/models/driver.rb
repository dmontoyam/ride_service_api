class Driver < ActiveRecord::Base
  extend Geocoder::Model::ActiveRecord
  has_many :ride_services

  def self.drivers
    Driver.all.to_json
  end

  def self.driver(id)
    Driver.where(id: id).first.to_json
  end
end

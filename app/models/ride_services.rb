class RideServices < ActiveRecord::Base
  extend Geocoder::Model::ActiveRecord
  belongs_to :rider
	belongs_to :driver

  #First step to create the ride for a client(rider)
  def self.ride_service(rider, driver, final_latitude, final_longitude)
      status = ''
      ride_service = nil
      distance_in_km = Geocoder::Calculations.distance_between([rider.current_latitude,rider.current_longitude],
            [final_latitude,final_longitude], :units => :km)
      if !distance_in_km.blank?
        ride_service = RideServices.new
        ride_service.driver_id = driver.id
        ride_service.rider_id = rider.id
        ride_service.current_latitude = rider.current_latitude
        ride_service.current_longitude = rider.current_longitude
        ride_service.final_latitude = final_latitude
        ride_service.final_longitude = final_longitude

        distance_in_km = distance_in_km.round(1)
        minutes = ((distance_in_km / 50) * 60)
        charge = (distance_in_km * 1000) + (minutes * 200) + 3500
        ride_service.charge = charge.round(0)
        ride_service.paid_out = false
        ride_service.status = 'OPEN'
        ride_service.distance_km = distance_in_km

        if ride_service.save
          status = 'OK'
        else
          status = 'ERROR'
        end
      end

      return {status: status, ride_service: ride_service}
  end
end

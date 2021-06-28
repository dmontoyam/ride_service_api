class RideServicesController < Sinatra::Base
  extend Geocoder::Model::ActiveRecord

  #Ride service with a speed of approximately 50 km
  def self.ride_service(rider_email,final_latitude,final_longitude)
    rider = Rider.find_by_email(rider_email)
    status = ''
    ride_service = nil
    if !rider.blank?
      driver = Driver.where("city = '#{rider.city}'").first
      if !driver.blank?
        ride_service = RideServices.ride_service(rider, driver, final_latitude, final_longitude)

        if ride_service[:status] == 'OK'
          ride_service = ride_service[:ride_service]
          status = 'OK'
        else
          status = 'ERROR'
        end
      end
    else
      status = 'ERROR'
    end

    return {status: status, ride_service: ride_service}
  end

  #Geocoder Example
  def self.geocoder_example
    driver = Driver.where('id = 1').first
    rider = Rider.where('id = 1').first
    distance = Geocoder::Calculations.distance_between([driver.current_latitude,driver.current_longitude],
      [rider.current_latitude,rider.current_longitude], :units => :km)
    return distance.to_json
  end
end

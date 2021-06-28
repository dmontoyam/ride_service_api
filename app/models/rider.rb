class Rider < ActiveRecord::Base
  extend Geocoder::Model::ActiveRecord
  has_many :ride_services

  # params do
  #   required(:email).filled(:string)
  #   required(:age).value(:integer)
  # end
  #
  # rule(:email) do
  #   unless /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.match?(value)
  #     key.failure('has invalid format')
  #   end
  # end
  #
  # rule(:age) do
  #   key.failure('must be greater than 18') if value <= 18
  # end

  def self.riders
    Rider.all.to_json
  end

  def self.rider(id)
    Rider.where(id: id).first.to_json
  end

  def self.find_by_email(email)
    Rider.where("email = '#{email}'").first
  end
end

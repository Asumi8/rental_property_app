class Property < ApplicationRecord
  validates :property_name, :rent, :address, :building_age, presence: true 
  has_many :nearest_stations, dependent: :destroy
  accepts_nested_attributes_for :nearest_stations, reject_if: proc {|attributes| attributes['line'].blank? and attributes['station_name'].blank? and attributes['walking_minutes'].blank?}, allow_destroy:true
end



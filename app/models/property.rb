class Property < ApplicationRecord
  has_many :nearest_stations
  rails_accepts_nested_attributes_for :nearest_stations, reject_if: proc {|attributes| attributes['line'].blank? and attributes['station_name'].blank? and attributes['walking_minutes'].blank?}, allow_destroy:true
end

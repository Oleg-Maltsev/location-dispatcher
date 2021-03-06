class Provider < ActiveRecord::Base
  has_many :addresses

  validates :name, :symbol, presence: true
  validates :sequence_number, numericality: { greater_than_or_equal_to: 0, only_integer: true }, presence: true

  def geocoder
    Geocoders.const_get(symbol.capitalize).const_get('Client').new
  end
end
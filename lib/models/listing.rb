class Listing < ActiveRecord::Base
  belongs_to :realtor
  has_many :customers, through: :realtor

  def self.view_all
    Listing.all.each_with_index do |listing, index|
      puts "------------------------------------------"
      puts "  Listing ##{index + 1}:"
      puts " - - - - - - - - - - - - - - - - - - - - -"
      puts "  Address      : #{listing.address}"
      puts "  City         : #{listing.city}"
      puts "  Neighborhood : #{listing.neighborhood}"
      puts "  Bedrooms     : #{listing.bedrooms}"
      puts "  Bathrooms    : #{listing.bathrooms}"
      puts "  Price        : #{listing.price}"
      puts "  Property Type: #{listing.property_type}"
      puts "  Pet Friendly : #{listing.pets}"
      puts "------------------------------------------"
    end
  end

end

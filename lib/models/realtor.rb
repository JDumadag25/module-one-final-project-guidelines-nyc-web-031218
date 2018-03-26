class Realtor < ActiveRecord::Base
  has_many :listings
  has_many :customers
end

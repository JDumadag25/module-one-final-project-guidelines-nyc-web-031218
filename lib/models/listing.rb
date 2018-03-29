class Listing < ActiveRecord::Base
  belongs_to :realtor
  has_many :clients, through: :realtor
end

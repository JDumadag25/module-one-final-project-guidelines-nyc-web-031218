class Listing < ActiveRecord::Base
  belongs_to :realtor
  has_many :customers, through: :realtor 
end

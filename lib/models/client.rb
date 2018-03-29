class Client < ActiveRecord::Base
  belongs_to :realtor
  has_many :listings, through: :realtor
end

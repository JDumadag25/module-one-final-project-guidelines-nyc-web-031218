class Realtor < ActiveRecord::Base
  has_many :listings
  has_many :customers

  def get_customer
    self.customers << Customer.find_by(realtor_id: nil)
  end


end

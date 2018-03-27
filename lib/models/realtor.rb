class Realtor < ActiveRecord::Base
  has_many :listings
  has_many :customers

  def aquire_customer
    self.customers << Customer.find_by(realtor_id: nil)
  end

  def get_listings_for_customer_by_name(name)
    customer = Customer.find_by(name: name)
    get_listings_by_location(customer)
  end

  def get_listings_by_location(customer)
    customers_listings = Listing.all
    if customer.city != nil
      customers_listings = customers_listings.select {|listing|
      listing.city == customer.city }
    end
    if customer.neighborhood != nil
      customers_listings = customers_listings.select {|listing|
      listing.neighborhood == customer.neighborhood}
    end
    get_listings_by_bedrooms(customer, customers_listings)
  end

  def get_listings_by_bedrooms(customer, customers_listings)
    if customer.bedrooms != nil
      customers_listings = customers_listings.select {|listing|
      listing.bedrooms == customer.bedrooms}
    end
    get_listings_by_bathrooms(customer, customers_listings)
  end

  def get_listings_by_bathrooms(customer, customers_listings)
    if customer.bathrooms != nil
      customers_listings = customers_listings.select {|listing|
      listing.bathrooms == customer.bathrooms}
    end
    get_listings_by_price_range(customer, customers_listings)
  end

  def get_listings_by_price_range(customer, customers_listings)
    if customer.lowest_price != nil
      customers_listings = customers_listings.select {|listing|
      listing.price >= customer.lowest_price}
    end
    if customer.highest_price != nil
      customers_listings = customers_listings.select {|listing|
      listing.price <= customer.highest_price}
    end
    get_listings_by_pets(customer, customers_listings)
  end


  def get_listings_by_pets(customer, customers_listings)
    if customer.pets? != false
      customers_listings = customers_listings.select {|listing|
      listing.pets}
    end 
    customers_listings
  end

end

class Realtor < ActiveRecord::Base
  has_many :listings
  has_many :customers

  def aquire_customer
    customer = Customer.find_by(realtor_id: nil)
    if customer
      customer.update(realtor_id: self.id)
    else
      puts "\n\n ------------------------------------------"
      puts "|    There are no new clients available    |"
      puts " ------------------------------------------\n"
    end
  end

  def view_all_customers
    customers = Customer.all.select {|customer|
      customer.realtor_id == self.id }
    puts customers
  customers.each_with_index do |client, index|
      puts "------------------------------------------"
      puts "  Client ##{index + 1}: "
      puts " - - - - - - - - - - - - - - - - - - - - -"
      puts "  Name         : #{client.name}"
      puts "  E-mail       : #{client.email}"
      puts "  Phone        : #{client.phone}"
      puts "  City         : #{client.city}"
      puts "  Neighborhood : #{client.neighborhood}"
      puts "  Bedrooms     : #{client.bedrooms}"
      puts "  Bathrooms    : #{client.bathrooms}"
      puts "  Price Range  : #{client.lowest_price} - #{client.highest_price}"
      puts "  Pet owner    : #{client.pets}"
      puts "------------------------------------------"
    end
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

  def drop_customer_by_name(name)
    user = Customer.find_by(name: name)
    if user != nil
      user.destroy
    else
      puts "\nSorry, could not client."
      puts "Make sure you input the correct name for the client.\n"
    end
  end

  def drop_listing_by_address(address)
    listing = Listing.find_by(address: address)
    if listing != nil
      listing.destroy
    else
      puts "\nSorry, could not find listing."
      puts "Make sure you input the correct address\n"
    end
  end

  def close_deal(client, address)
    self.drop_customer_by_name(client)
    self.drop_listing_by_address(address)
  end

  def create_listing
    puts "\nPlease enter the following information:"
    puts "\nAddress:\n"
    address = gets.chomp
    puts "\nCity:\n"
    city = gets.chomp
    puts "\nNeighborhood:\n"
    neighborhood = gets.chomp
    puts "\nBedrooms:\n"
    bedrooms = gets.chomp
    puts "\nBathrooms\n"
    bathrooms = gets.chomp
    puts "\nPrice\n"
    price = gets.chomp.to_f
    puts "\nProperty Type\n"
    property_type = gets.chomp
    puts "\nPet Friendly? Input 'y' for yes and 'n' for no\n"
    pets = gets.chomp.downcase
    if pets == 'y'
      pets = true
    else
      pets = false
    end

    Listing.create(address: address, city: city,
      neighborhood: neighborhood, bedrooms: bedrooms, bathrooms: bathrooms, pets: pets, price: price,
      property_type: property_type)
  end
end

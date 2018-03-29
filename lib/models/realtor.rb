class Realtor < ActiveRecord::Base
  has_many :listings
  has_many :clients


##### Step 1
def view_all_listings
  print_all_listings
end

###### Step 2
  def view_all_clients
    clients = get_your_clients
    print_all_clients(clients)
  end

  def get_your_clients
    Client.all.select do |client|
      client.realtor_id == self.id
    end
  end

#### Step 3
################### GET LISTINGS FOR CLIENT BY NAME ####################
  def get_listings_for_client_by_name(name)
    client = Client.find_by(name: name)
    client_listings = []
    if client && get_your_clients.include?(client)
      client_listings = Listing.all
      client_listings = select_listings(client_listings, client, 'city')
      client_listings = select_listings(client_listings, client, 'neighborhood')
      client_listings = select_listings(client_listings, client, 'bedrooms')
      client_listings = select_listings(client_listings, client, 'bathrooms')
      client_listings = select_listings_pets(client, client_listings)
      client_listings = select_listings_price_range(client, client_listings)
    end
    client_listings
  end

  def select_listings(client_listings, client, data)
    if client[data]
      client_listings = client_listings.select do |listing|
          listing[data] == client[data]
      end
    end
    client_listings
  end

  def select_listings_pets(client, client_listings)
    if client.pets
      client_listings = client_listings.select do |listing|
        listing.pets
      end
    end
    client_listings
  end

  def select_listings_price_range(client, client_listings)
    if client.lowest_price != nil
      client_listings = client_listings.select do |listing|
        listing.price >= client.lowest_price
      end
    end
    if client.highest_price != nil
      client_listings = client_listings.select do |listing|
        listing.price <= client.highest_price
      end
    end
    client_listings
  end

##### Step 4
  def aquire_client
    client = Client.find_by(realtor_id: nil)
    if client
      client.update(realtor_id: self.id)
    else
      print_no_clients_available
    end
  end

###### Step 5
  def drop_client_by_name(name)
    client = Client.find_by(name: name)
    if client.realtor_id == self.id
      client.destroy
    else
      print_client_not_found
    end
  end

  ##### Step 6
  def create_listing
    puts "\nPlease enter the following information:"
    puts "\nAddress:\n"
    address = gets.chomp
    puts "\nCity:\n"
    city = gets.chomp
    puts "\nNeighborhood:\n"
    neighborhood = gets.chomp
    puts "\nBedrooms:\n"
    bedrooms = gets.chomp.to_i
    puts "\nBathrooms\n"
    bathrooms = gets.chomp.to_i
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

#### Step 7
  def drop_listing_by_address(address)
    listing = Listing.find_by(address: address)
    if listing
      listing.destroy
    else
      print_listing_not_found
    end
  end
###### Step 8
  def close_deal(client, address)
    self.drop_client_by_name(client)
    self.drop_listing_by_address(address)
  end
end

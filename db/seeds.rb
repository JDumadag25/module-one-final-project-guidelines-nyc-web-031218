
jon = Realtor.create(name: "Jon", user_name: "Jon", password: "password", phone: "324-342-3254", email: "Jon@Flatironreality.com")
justin = Realtor.create(name: "Justin", user_name: "Justin", password: "pass", phone: "543-353-3532", email: "Justin@Flatironreality.com")
dick = Customer.create(name: "Dick", user_name: "Dick", password: "dick", phone: "534-657-5463", email: "Dick@Flatiron.com", city: "New York", neighborhood: "Midtown", bedrooms: 3,
bathrooms: 2, pets: true, lowest_price: 1000, highest_price: 3000)
graham = Customer.create(name: "Graham", user_name: "Graham" , password: "graham", phone: "432-436-1233", email: "Graham@Flatiron.com", city: "New York", neighborhood: "Chelsea", bedrooms: 2,
bathrooms: 1, pets: false, lowest_price: 1500, highest_price: 5000)
natalie = Customer.create(name: "Natalie", user_name: "Natalie", password: "natalie", phone: "467-546-6756", email: "Natalie@flatiron.com", city: "New York", neighborhood: "Brooklyn", bedrooms: 3,
bathrooms: 2, pets: true, lowest_price: 1200, highest_price: 5000)
rishi = Customer.create(name: "Rishi", user_name: "Rishi", password: "rishi", phone: "643-465-2346", email: "Rishi@Flatiron.com", city: "New York", neighborhood: "Hell's Kitchen", bedrooms: 4,
bathrooms: 1, pets: true, lowest_price: 1000, highest_price: 4000)
property_1 = Listing.create(address: "123 State ST", city: "New York", neighborhood: "Chelsea", bedrooms: 2, bathrooms: 1, pets: false, price: 3300, property_type: "apt")
property_2 = Listing.create(address: "666 Hells ST", city: "New York", neighborhood: "Brooklyn", bedrooms: 1, bathrooms: 1, pets: true, price: 1200, property_type: "apt")
property_3 = Listing.create(address: "777 Jesus AVE", city: "New York", neighborhood: "Harlem", bedrooms: 3, bathrooms: 2, pets: true, price: 3500, property_type: "apt")
property_4 = Listing.create(address: "1738 Wap AVE", city: "New York", neighborhood: "Hell's Kitchen", bedrooms: 3, bathrooms: 2, pets: false, price: 35000, property_type: "condo")
property_5 = Listing.create(address: "8675 Jenny WAY", city: "New York", neighborhood: "Midtown", bedrooms: 2, bathrooms: 1, pets: true, price: 2300, property_type: "apt")
property_6 = Listing.create(address: "567 Sour Patch Street", city: "New York", neighborhood: "Washington Heights", bedrooms: 4, bathrooms: 2, pets: false, price: 1350, property_type: "condo")
property_7 = Listing.create(address: "Dick street", city: "New York", neighborhood: "Midtown", bedrooms: 3, bathrooms: 2, pets: true, price: 1350, property_type: "condo")
property_8 = Listing.create(address: "Dick Ave", city: "New York", neighborhood: "Midtown", bedrooms: 3, bathrooms: 2, pets: true, price: 2500, property_type: "condo")
property_9 = Listing.create(address: "Graham Street", city: "New York", neighborhood: "Chelsea", bedrooms: 2, bathrooms: 1, pets: false, price: 1900, property_type: "condo")
property_10 = Listing.create(address: "Graham Ave", city: "New York", neighborhood: "Chelsea", bedrooms: 2, bathrooms: 1, pets: true, price: 5000, property_type: "condo")
property_11 = Listing.create(address: "Natalie Street", city: "New York", neighborhood: "Brooklyn", bedrooms: 3, bathrooms: 2, pets: true, price: 1350, property_type: "condo")
property_12 = Listing.create(address: "Natalie Ave", city: "New York", neighborhood: "Brooklyn", bedrooms: 3, bathrooms: 2, pets: true, price: 2000, property_type: "condo")
property_13 = Listing.create(address: "Rishi Street", city: "New York", neighborhood: "Hell's Kitchen", bedrooms: 4, bathrooms: 1, pets: false, price: 1350, property_type: "condo")
property_14 = Listing.create(address: "Rishi Ave", city: "New York", neighborhood: "Hell's Kitchen", bedrooms: 4, bathrooms: 1, pets: true, price: 3500, property_type: "condo")

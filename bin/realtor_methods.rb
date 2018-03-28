
def prompt_realtor_username
  puts "\nPlease input your user name:\n"
  user_name = gets.chomp
  while Realtor.all.find_by(user_name: user_name) == nil
    puts "\nSorry, the user name you input does not exist"
    puts "Please input a valid user name:\n"
    user_name = gets.chomp
  end
  user_name
end

def prompt_realtor_password(user_name)
  puts "\nPlease input your password:\n"
  password = gets.chomp
  while Realtor.all.find_by(user_name: user_name).password != password
    puts "\nSorry, the password you entered is invalid"
    puts "Please input your valid password\n"
    password = gets.chomp
  end
  password
end

def show_realtor_options(realtor)
  puts "\n\n################################"
  puts "#             MENU             #"
  puts "#------------------------------#"
  puts "#------------------------------#"
  puts "#  1. View all listings        #"
  puts "#  2. View all your clients    #"
  puts "#  3. Get clients's listings   #"
  puts "#  4. Aquire new client        #"
  puts "#  5. Drop a client            #"
  puts "#  6. Create a new listing     #"
  puts "#  7. Drop a listing           #"
  puts "#  8. Close a deal             #"
  puts "#  9. Return to main meu       #"
  puts "################################"
  puts "\nChoose an option (1-9):\n"
  option = gets.chomp.to_i
  do_realtor_option(option, realtor)
end

def do_realtor_option(option, realtor)
  case option
  when 1
    Listing.view_all
    show_realtor_options(realtor)
  when 2
    if realtor.view_all_customers.count == 0
      puts "\n\n --------------------------------------------------"
      puts "|       YOU CURRENTLY DON'T HAVE ANY CLIENTS       |"
      puts "|  Hint: Select option #4 to aquire a new client   |"
      puts " --------------------------------------------------\n"
    else
      realtor.view_all_customers
    end
    show_realtor_options(realtor)
  when 3
    puts "\nPlease input the name of a client you would like to match listings to:\n"
    name = gets.chomp
    ### WE COULD VALIDATE NAME IF WE WANTED
    client_listings = realtor.get_listings_for_customer_by_name(name)
    puts "\n\n###########################################"
    puts "#           Listings for #{name}          #"
    puts "###########################################\n"
    client_listings.each_with_index do |listing, index|
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
    show_realtor_options(realtor)
  when 4
    puts realtor.aquire_customer
    show_realtor_options(realtor)
  when 5
    puts "\nPlease input the name of the client you would like to drop:\n"
    name = gets.chomp
    puts realtor.drop_customer_by_name(name)
    show_realtor_options(realtor)
  when 6
    realtor.create_listing
    show_realtor_options(realtor)
  when 7
    puts "\nEnter the address of the listing you would like to drop"
    drop_address = gets.chomp
    realtor.drop_listing_by_address(drop_address)
    show_realtor_options(realtor)
  when 8
    puts "\nPlease enter the name of the client:\n"
    client = gets.chomp
    puts "\nEnter the address of the listing:\n"
    address = gets.chomp
    realtor.close_deal(client, address)
    puts "CONGRATULATIONS #{realtor.name} you closed the deal and made some $$$$$"
    show_realtor_options(realtor)
  when 9
    puts "\nReturning to main menu!"
    main_program
  else
    puts "\nInvalid Input. Please enter a number from 1-5\n"
    show_realtor_options(realtor)
  end
end

def create_realtor
  puts "\nPlease enter a user name:\n"
  user_name = gets.chomp
  while Realtor.all.find_by(user_name: user_name)
    puts "\nSorry, that user name is already taken."
    puts "Please enter a user name:\n"
    user_name = gets.chomp
  end
  password_1 = 1
  password_2 = 2
  while password_1 != password_2
    puts "\nPlease enter a password:\n"
    password_1 = gets.chomp
    puts "\nPlease re-enter your password:\n"
    password_2 = gets.chomp
  end
  puts "\nPlease enter your name:\n"
  name = gets.chomp
  puts "Please enter your phone number (xxx-xxx-xxxx):\n"
  phone = gets.chomp
  puts "Please enter your email:\n"
  email = gets.chomp
  user = Realtor.create(name: name, user_name: user_name, password: password_1, phone: phone, email: email)
end

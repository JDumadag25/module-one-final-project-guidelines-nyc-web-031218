def prompt_realtor_username
  puts "\nPlease input your user name:\n"
  user_name = gets.chomp
  while Realtor.all.find_by(user_name: user_name) == nil
    print_invalid_username
    user_name = gets.chomp
  end
  user_name
end

def prompt_realtor_password(user_name)
  puts "\nPlease input your password:\n"
  password = gets.chomp
  while Realtor.all.find_by(user_name: user_name).password != password
    print_invalid_password
    password = gets.chomp
  end
  password
end

def show_realtor_options(realtor)
  print_realtor_options
  option = gets.chomp.to_i
  do_realtor_option(option, realtor)
end

def do_realtor_option(option, realtor)
  case option
  when 1
    realtor.view_all_listings
    show_realtor_options(realtor)
  when 2
    if realtor.get_your_clients.count == 0
      print_no_clients
    else
      realtor.view_all_clients
    end
    show_realtor_options(realtor)
  when 3
    puts "\nPlease input the name of a client you would like to match listings to:\n"
    name = gets.chomp
    available_clients = realtor.get_your_clients
    if !Client.find_by(name: name)
      print_client_not_found
    elsif available_clients.count == 0
      print_no_clients
    else
      client_listings = realtor.get_listings_for_client_by_name(name)
      if client_listings.count == 0
        print_no_match_for_client
      else
        print_client_listings(name, client_listings)
      end
    end
    show_realtor_options(realtor)
  when 4
    puts realtor.aquire_client
    show_realtor_options(realtor)
  when 5
    puts "\nPlease input the name of the client you would like to drop:\n"
    name = gets.chomp
    realtor.drop_client_by_name(name)
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
    print_close_deal(realtor)
    show_realtor_options(realtor)
  when 9
    goodbye
  else
    print_invalid_realtor_input
    show_realtor_options(realtor)
  end
end

def create_realtor
  puts "\nPlease enter the company's password to create an account:\n"
  company_password_input = gets.chomp
  if company_password_input != "HelloWorld"
    print_invalid_company_password
    main_program
  end
  puts "\nPlease enter a user name:\n"
  user_name = gets.chomp
  while Realtor.all.find_by(user_name: user_name)
    print_invalid_username_taken
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

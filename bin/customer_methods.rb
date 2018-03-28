def prompt_customer_username
  puts "\nPlease input your user name:\n"
  user_name = gets.chomp
  while Customer.all.find_by(user_name: user_name) == nil
    puts "\nSorry, the user name you input does not exist"
    puts "Please input a valid user name:\n"
    user_name = gets.chomp
  end
  user_name
end

def prompt_customer_password(user_name)
  puts "\nPlease input your password:\n"
  password = gets.chomp
  while Customer.all.find_by(user_name: user_name).password != password
    puts "\nSorry, the password you entered is invalid"
    puts "Please input your valid password\n"
    password = gets.chomp
  end
  password
end

def create_customer
  puts "\nPlease enter a user name:\n"
  user_name = gets.chomp
  while Customer.all.find_by(user_name: user_name)
    puts "\nSorry, that user name is already taken."
    puts "Please enter a user name:\n"
    user_name = gets.chomp.to_i
  end
  password_1 = 1
  password_2 = 2
  while password_1 != password_2
    puts "\nPlease enter a password:\n"
    password_1 = gets.chomp
    puts "Please re-enter your password:\n"
    password_2 = gets.chomp
  end
  puts "\nPlease enter your name:\n"
  name = gets.chomp
  puts "Please enter your phone number (xxx-xxx-xxxx):\n"
  phone = gets.chomp
  puts "Please enter your email:\n"
  email = gets.chomp
  ### No for the apartment question
  puts "\nOk. So now for the good stuff!\n"
  puts "What city would you like to live in?\n"
  city = gets.chomp
  puts "What neighborhood would you like to see listings for?\n"
  neighborhood = gets.chomp
  puts "How many bedrooms?\n"
  bedrooms = gets.chomp
  puts "How many bathrooms?\n"
  bathrooms = gets.chomp
  puts "Do you have any pets? Answer 'y' for yes, 'n' for no\n"
  pets = gets.chomp.downcase
  if pets == 'y'
    pets = true
  else
    pets = false
  end
  puts "What is your lowest price?\n"
  lowest_price = gets.chomp
  puts "What is your highest price?\n"
  highest_price = gets.chomp

  user = Customer.create(name: name, user_name: user_name, password: password_1,
    phone: phone, email: email, city: city, neighborhood: neighborhood, bedrooms: bedrooms,
    bathrooms: bathrooms, pets: pets, lowest_price: lowest_price, highest_price: highest_price)
end

def show_customer_options(customer)
  puts "\n\n#######################################"
  puts "#                MENU                 #"
  puts "#-------------------------------------#"
  puts "#-------------------------------------#"
  puts "#  1. View your profile               #"
  puts "#  2. View your realtor information   #"
  puts "#  3. Delete your account             #"
  puts "#  4. Return to main menu             #"
  puts "#######################################"
  puts "\nPlease choose an option(1-4):"
  option = gets.chomp.to_i
  do_customer_option(option, customer)
end

def do_customer_option(option, customer)
  case option
  when 1
    show_customer_info(customer)
    show_customer_options(customer)
  when 2
    view_realtor_info(customer)
    show_customer_options(customer)
  when 3
    customer.destroy
    puts "\n\n -------------------------------------------------"
    puts "|        Thank your for using out dope app        |"
    puts "| If you need more apartments be sure to comeback |"
    puts " -------------------------------------------------"
    puts "|                  GOODBYE!                       |"
    puts " -------------------------------------------------"
  when 4
    main_program
  else
    puts "\n ----------------"
    puts "| Invalid Input! |"
    puts " ----------------"
    puts "\nPlease enter a numerical value 1-4\n"
    show_customer_options(customer)
  end
end

def view_realtor_info(customer)
  if customer.realtor_id != nil
    name = customer.realtor.name
    phone = customer.realtor.phone
    email = customer.realtor.email
    puts "\n\nYour realtor is: #{name}"
    puts "email: #{email}"
    puts "phone: #{phone}"
  else
    puts "\n --------------------------------------------"
    puts "| Sorry. You do not have an assigned realtor |"
    puts "|  Please be patient and check again later   |"
    puts " --------------------------------------------"
  end
end

def show_customer_info(customer)
  puts "\n\nThis is your information!\n"
  puts "User Name: #{customer.user_name}"
  puts "Email: #{customer.email}"
  puts "Phone: #{customer.phone}"
  puts "City of choice: #{customer.city}"
  puts "Neighborhood of choice: #{customer.neighborhood}"
  puts "Number of bedrooms: #{customer.bedrooms}"
  puts "Number of bathrooms: #{customer.bathrooms}"
  puts "Lowest asking price: #{customer.lowest_price}"
  puts "Maximum price: #{customer.highest_price}"
  value = "no"
  if customer.pets
    value = "yes"
  end
  puts "Pet accessable: #{value}"
end

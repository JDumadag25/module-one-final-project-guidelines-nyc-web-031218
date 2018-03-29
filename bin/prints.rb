#### PRINT METHODS
def welcome
  puts "\n\n###############################################"
  puts '###############################################'
  puts '##                                           ##'
  puts '##                WELCOME TO                 ##'
  puts '##              FLATIRON REALTY              ##'
  puts '##                                           ##'
  puts '###############################################'
  puts "###############################################\n\n"
end

############### REALTOR ########################
def print_realtor_options
  puts "\n\n###############################################"
  puts "##                  MENU                     ##"
  puts "##-------------------------------------------##"
  puts "##-------------------------------------------##"
  puts "##       1. View all listings                ##"
  puts "##       2. View all your clients            ##"
  puts "##       3. Get clients's listings           ##"
  puts "##       4. Acquire new client               ##"
  puts "##       5. Drop a client                    ##"
  puts "##       6. Create a new listing             ##"
  puts "##       7. Drop a listing                   ##"
  puts "##       8. Close a deal                     ##"
  puts "##       9. Exit program                     ##"
  puts '###############################################'
  puts "\nChoose an option (1-9):\n"
end

def print_all_clients(clients)
  clients.each_with_index do |client, index|
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

def print_all_listings
  Listing.all.each_with_index do |listing, index|
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
end

def print_client_listings(name, client_listings)
  puts "\n\n###########################################"
  puts "          Listings for #{name}"
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
end

def print_no_match_for_client
  puts "\n --------------------------------------------------"
  puts "|          NO MATCH FOUND FOR YOU CLIENT           |"
  puts "|- - - - - - - - - - - - - - - - - - - - - - - - - |"
  puts "|           You have a very picky client           |"
  puts " --------------------------------------------------\n"
end
def print_no_clients
  puts "\n --------------------------------------------------"
  puts "|       YOU CURRENTLY DON'T HAVE ANY CLIENTS       |"
  puts "|- - - - - - - - - - - - - - - - - - - - - - - - - |"
  puts "|  Hint: Select option #4 to aquire a new client   |"
  puts " --------------------------------------------------\n"
end

def print_no_clients_available
  puts "\n --------------------------------------------------"
  puts "|          THERE ARE NO CLIENTS AVAILABLE          |"
  puts "|- - - - - - - - - - - - - - - - - - - - - - - - - |"
  puts "|                   Hang in there                  |"
  puts " --------------------------------------------------\n"
end

def print_close_deal(realtor)
  puts "\n --------------------------------------------------"
  puts "           CONGRATULATIONS #{realtor.name}          "
  puts " - - - - - - - - - - - - - - - - - - - - - - - - -  "
  puts "      You closed the deal and made some bank!       "
  puts " --------------------------------------------------\n"
end

def print_client_not_found
  puts "\n --------------------------------------------------"
  puts "|            COULD NOT FIND YOUR CLIENT            |"
  puts "|- - - - - - - - - - - - - - - - - - - - - - - - - |"
  puts "|      Input the correct name for the client       |"
  puts " --------------------------------------------------\n"
end

def print_listing_not_found
  puts "\n --------------------------------------------------"
  puts "|            COULD NOT FIND THAT LISTING           |"
  puts "|- - - - - - - - - - - - - - - - - - - - - - - - - |"
  puts "|            Input the correct address             |"
  puts " --------------------------------------------------\n"
end

def print_invalid_realtor_input
  puts "\n ---------------------------------------------------"
  puts "|                   INVALID INPUT                   |"
  puts "|- - - - - - - - - - - - - - - - - - - - - - - - - -|"
  puts "|        Please enter a numeric value (1-9)         |"
  puts " ---------------------------------------------------\n"
end

def print_invalid_company_password
  puts "\n ---------------------------------------------------"
  puts "|            INVALID COMPANY PASSWORD               |"
  puts "|- - - - - - - - - - - - - - - - - - - - - - - - - -|"
  puts "|               BACK TO MAIN PAGE!                  |"
  puts " ---------------------------------------------------\n"
end


################### CLIENT ######################
def print_client_options

  puts "\n\n###############################################"
  puts "##                  MENU                     ##"
  puts "##-------------------------------------------##"
  puts "##-------------------------------------------##"
  puts "##       1. View your profile                ##"
  puts "##       2. View your realtor information    ##"
  puts "##       3. Update your preferences          ##"
  puts "##       3. Delete your account              ##"
  puts "##       4. Exit program                     ##"
  puts '###############################################'
  puts "\nPlease choose an option(1-4):\n"
end

def print_client_update_options
  puts "\n\n###############################################"
  puts "##                  MENU                     ##"
  puts "##-------------------------------------------##"
  puts "##-------------------------------------------##"
  puts "##       1. Change city                      ##"
  puts "##       2. Change neighborhood              ##"
  puts "##       3. Change number of bedrooms        ##"
  puts "##       4. Change number of bathrooms       ##"
  puts "##       5. Change lowest price              ##"
  puts "##       6. Change highest price             ##"
  puts "##       7. Change pet option                ##"
  puts '###############################################'
  puts "\nPlease choose an option(1-7):\n"

end
def print_client_destroy
  puts "\n------------------------------------------------------"
  puts "------------------------------------------------------"
  puts "| |        Thank your for using out dope app        | |"
  puts "| | If you need more apartments be sure to comeback | |"
  puts "| |- - - - - - - - - - - - - - - - - - - - - - - - -| |"
  puts "| |                  GOODBYE!                       | |"
  puts "------------------------------------------------------"
  puts "------------------------------------------------------\n"
end

def print_invalid_client_option
  puts "\n ---------------------------------------------------"
  puts "|                 INVALID INPUT                     |"
  puts "|- - - - - - - - - - - - - - - - - - - - - - - - - -|"
  puts "|       Please enter a numeric value (1-4)          |"
  puts " ---------------------------------------------------\n"
end

def print_invalid_client_option_update
  puts "\n ---------------------------------------------------"
  puts "|                 INVALID INPUT                     |"
  puts "|- - - - - - - - - - - - - - - - - - - - - - - - - -|"
  puts "|       Please enter a numeric value (1-7)          |"
  puts " ---------------------------------------------------\n"
end

def print_no_realtor_for_client
  puts "\n ---------------------------------------------------"
  puts "|    SORRY. YOU DO NOT HAVE AN ASSIGNED REALTOR     |"
  puts "|- - - - - - - - - - - - - - - - - - - - - - - - - -|"
  puts "|      Please be patient and check again later      |"
  puts " ---------------------------------------------------\n"
end

def print_client_info(client)
  puts "\n\n##########################################"
  puts "          This is your information         "
  puts "###########################################\n"
  puts "   User Name: #{client.user_name}"
  puts "   Email: #{client.email}"
  puts "   Phone: #{client.phone}"
  puts "   City of choice: #{client.city}"
  puts "   Neighborhood of choice: #{client.neighborhood}"
  puts "   Number of bedrooms: #{client.bedrooms}"
  puts "   Number of bathrooms: #{client.bathrooms}"
  puts "   Lowest asking price: #{client.lowest_price}"
  puts "   Maximum price: #{client.highest_price}"
  value = "no"
  if client.pets
    value = "yes"
  end
  puts "   Pet accessable: #{value}"
  puts "###########################################\n"
end

def print_realtor_info(name, email, phone)
  puts "\n\n##########################################"
  puts "            This is your realtor           "
  puts "###########################################\n"
  puts "   Name: #{name}"
  puts "   Email: #{email}"
  puts "   Phone: #{phone}"
  puts "###########################################\n"
end

########## REALTOR && CLIENT #######################
def print_invalid_account_input
  puts "\n ---------------------------------------------------"
  puts "|                   INVALID INPUT                   |"
  puts "|- - - - - - - - - - - - - - - - - - - - - - - - - -|"
  puts "|       Please input 'y' for yes and 'n' for no     |"
  puts " ---------------------------------------------------\n"
end

def print_invalid_username_taken
  puts "\n ---------------------------------------------------"
  puts "|           SORRY, THAT USER NAME IS TAKEN          |"
  puts "|- - - - - - - - - - - - - - - - - - - - - - - - - -|"
  puts "|           Please enter another user name          |"
  puts " ---------------------------------------------------\n"
end

def print_invalid_username
  puts "\n ---------------------------------------------------"
  puts "|            THAT USER NAME DOES NOT EXIST          |"
  puts "|- - - - - - - - - - - - - - - - - - - - - - - - - -|"
  puts "|               Enter a valid user name             |"
  puts " ---------------------------------------------------\n"
end

def print_invalid_password
  puts "\n ---------------------------------------------------"
  puts "|                   INVALID PASSWORD                |"
  puts "|- - - - - - - - - - - - - - - - - - - - - - - - - -|"
  puts "|                Enter a valid password             |"
  puts " ---------------------------------------------------\n"
end

def print_invalid_user_input
  puts "\n ---------------------------------------------------"
  puts "|                   INVALID INPUT                   |"
  puts "|- - - - - - - - - - - - - - - - - - - - - - - - - -|"
  puts "|  Please input 'r' for realtor and 'c' for client  |"
  puts " ---------------------------------------------------\n"
end

def goodbye
  puts "\n\n###############################################"
  puts '###############################################'
  puts '##                                           ##'
  puts '##            THANK YOU FOR USING            ##'
  puts '##              FLATIRON REALTY              ##'
  puts '##                                           ##'
  puts '###############################################'
  puts "###############################################\n\n"
end

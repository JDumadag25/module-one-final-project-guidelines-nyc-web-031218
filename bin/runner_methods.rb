def welcome
  puts "-------------------------"
  puts "---- FLATIRON REALTY ----"
  puts "-------------------------"
  puts"\nWelcome to Flatiron Realty!\n\n"
end
#### Checks if user is Realtor or Customer

def user_check
  puts "Are you a realtor or a client?\nPlease input 'r' for realtor and 'c' for client\n"
  user = gets.chomp.downcase
  while user != 'r' && user != 'c'
    puts "\nSorry, invalid input."
    puts "Please input 'r' for realtor and 'c' for client\n"
    user = gets.chomp.downcase
  end
  user
end


def existing_account_check
  puts "\nDo you have an account?\nPlease input: 'y' for yes and 'n' for no\n"
  existing = gets.chomp.downcase
  while existing != 'y' && existing != 'n'
    puts "\nSorry, invalid input. Please input: 'y' for yes and 'n' for no\n"
    existing = gets.chomp.downcase
  end
  existing
end

def main_program
  welcome
  puts "Press the enter/return to continue"
  puts "To exit program: type the word 'exit'\n"
  continue = gets.chomp.downcase
  abort("\nHope to see you soon!\n") unless continue != "exit"
  user = user_check
  existing = existing_account_check
  if user == 'c'
    if existing == 'y'
      user_name = prompt_customer_username
      password = prompt_customer_password(user_name)
      customer = Customer.all.find_by(user_name: user_name)
    else
      customer = create_customer
    end
      show_customer_options(customer)
  else
    if existing == 'y'
      #### ask for user_name and password
      user_name = prompt_realtor_username
      password = prompt_realtor_password(user_name)
      realtor = Realtor.all.find_by(user_name: user_name)
    else
      realtor = create_realtor
    end
    show_realtor_options(realtor)
  end
end

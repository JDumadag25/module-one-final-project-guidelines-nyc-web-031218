def user_check
  puts "Are you a realtor or a client?\nPlease input 'r' for realtor and 'c' for client\n"
  user = gets.chomp.downcase
  while user != 'r' && user != 'c'
    print_invalid_user_input
    user = gets.chomp.downcase
  end
  user
end

def existing_account_check
  puts "\nDo you have an account?\nPlease input: 'y' for yes and 'n' for no\n"
  existing = gets.chomp.downcase
  while existing != 'y' && existing != 'n'
    print_invalid_account_input
    existing = gets.chomp.downcase
  end
  existing
end

def main_program
  welcome
  puts "Press the enter/return to continue"
  puts "To exit program: type the word 'exit'\n"
  continue = gets.chomp.downcase
  abort(goodbye) unless continue != "exit"
  user = user_check
  existing = existing_account_check
  if user == 'c'
    if existing == 'y'
      user_name = prompt_client_username
      password = prompt_client_password(user_name)
      client = Client.all.find_by(user_name: user_name)
    else
      client = create_client
    end
      show_client_options(client)
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

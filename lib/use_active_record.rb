require 'rubygems'
require 'config/connection.rb'

puts "Info: utilizza active_record senza Rails"  
puts "Gestione database:"


#######################################
#
#if action == "u"
#   action2 = gets("Azione: l (list), i (insert)")
#   
#   if action2 == "i"
#      name = gets("Inserisci nome")
#      puts name
# 
#      surname = gets("Inserisci cognome ")
#      puts surname
#
#      email = gets("inserisci email ")
#      puts email
#
#      user = User.new
#      user.name = name
#      user.surname = surname
#      user.email = email
#      user.save
#   end
#   
  puts "Lista degli utenti"

 @users = User.all
 @users.each do |us|
    puts "name: " + us.name
    puts "surname: " + us.surname
    puts "email: " + us.email
 end
#end

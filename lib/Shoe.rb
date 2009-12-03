 Shoes.app do
   require 'rubygems'
   require 'Head.rb'
   @mind = Head::Brain.new    
   background "#DFA"
   para @mind.users.count.to_s
 end
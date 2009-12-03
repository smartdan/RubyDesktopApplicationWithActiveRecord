require 'config/connection.rb'

module Head

  class Brain 
     
     attr_reader :users, :contents, :acts    
       
     def initialize
      @users = User.all
      @contents = Content.all
      @acts = Activity.all 
     end
     
     def count_users
	     @users.length
     end

     def count_contenuti
	     @ncontents.length
     end

     def count_acts
        @acts.length
     end
  end
end
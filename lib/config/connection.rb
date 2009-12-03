   require 'yaml'

   require 'active_record'
      require 'logger'

	   
   dbconfig = YAML::load(File.open('config/database.yml'))
   ActiveRecord::Base.establish_connection(dbconfig['production'])
   ActiveRecord::Base.logger = Logger.new(STDERR) 

   #models
   require 'models/User.rb'
   require 'models/Content.rb'
   require 'models/Activity.rb'
	 
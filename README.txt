INSTALLATION and LOCAL DEPLOYMENT

The application requires that:

	- Ruby 2.0 is installed 
	- Rails 4.0 is installed 

	1. in terminal navigate to the root directory of the application

	2. type the following command: 

		'bundle'

	   this will load all the required gems needed for the application

	3. type the following command to run a local server:

		'rails s'

	4. Open a web browser and navigate to - http://localhost:3000/

	
THE IMPLEMENTED CODE

All application code contained within the "app" folder is my own unless otherwise specified in the comments.

This contains the main MVC components, helper methods and assets of the application where all functionality has been personally implemented. In addition to this, the "db/migrate" folder contains all the migration files used to build the database.

The Gemfile contains a list of the implemented gems used in the application. These have been fully referenced using a link to the relevant github page and an index to the full reference in the report. 

Rails scaffolds were used during the development for efficiency. To highlight where scaffolded code has been used, an example generic scaffold has been generated. This can be used to compare against my code to determine between the two. The filenames and directories of the example scaffold are:

- controllers/example_codes_controller.rb
- helpers/example_codes_helper.rb
- models/example.rb
- views/example  
- db/migrate/_create_example_codes 

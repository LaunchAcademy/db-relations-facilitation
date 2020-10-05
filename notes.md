# ActiveRecord Roadmapping Guidelines

Before beginning the assignment, make sure you cover the following bullets below, answering each of the questions succinctly. The aim here is not to create the app as a team line by line, but to create an outline or "roadmap" to guide you as you code and then break out into pairs or individual work.

* Take a moment to read over the assignment, and then discuss the **ER Diagram**. How will the ER Diagram change from step to step?
 If you would like, you could use a tool like Draw.io or [ziteboard](https://app.ziteboard.com/) to help you.

* What migration(s) need to be run in order to properly set up the app for the first part of the assignment?

* How can I revert changes I've made if I mess up a migration?

* Designate a path/route, erb template and model you will need for this step of the assignment?

* What ActiveRecord CRUD class methods will you need in order to get everything working?

* What do we think will be the most challenging portion of the implementation? Why? What resources do we have available to answer this question, and how can we escalate to getting support from the rest of the group or EEs?

* What pitfalls might be encounter? How can we make sure we stay on track and accountable when working?

* Who wants to potentially pair program?

### Tips
* Tuesday nights HW will cover how to retrieve a related record based on foreign key e.g. all of the crew-members for a starship. Read ahead if you are done with steps early.
* You will need to read about flash messages before you are able to efficiently show error and success messages on the page.
* `pry -r './server.rb'` will allow you to create and query the records in your databse. **You should no longer be using the `psql` command!**
* Both your terminal and Sinatra will yield errors, read them!
* Create records in a `db/seeds.rb` file. Running `rake db:seed` will run this file and create the records in the file.
* `rake db:test:prepare` needs to be run before running your tests but after creating your migrations, in order for your test database to work.
* AVOID COPY AND PASTE


#### One possible workflow:
* Create the required path/route and designate an erb template for that path.
* Determine what table will be needed for that route, and make a migration for it.
* Create the corresponding Activerecord model
* Correctly query the database (in your server.rb) to retrieve or create your record and store the result in an instance variable to be used in your erb template
* Add necessary validations
* If you need to access a records that have a `belongs_to` relationship, you will need to setup and create its parent entity in the database and as a model before you can work with it efficiently. Focus on starships first, then crewmembers!

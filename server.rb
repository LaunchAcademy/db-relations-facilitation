require "sinatra"
require "pg"
require "pry" if development? || test?
require "sinatra/reloader" if development?

require_relative "./app/models/user"


set :bind, '0.0.0.0'  # bind to all interfaces
set :views, File.join(File.dirname(__FILE__), "app", "views")

configure :development do
  set :db_config, { dbname: "users" }
end
# points our app at a development version of "users" database when tests are run


configure :test do
  set :db_config, { dbname: "users" }
end
# points our app at a test version of "users" database when tests are run

def db_connection
  begin
    connection = PG.connect(Sinatra::Application.db_config)
    # binding.pry
    # connection = PG.connect("users")
    yield(connection)
  ensure
    connection.close
  end
end
# this is the method that we will use to executre queries agaisnt our DB

get "/users" do
  # sql_users = nil
  
  # db_connection do |connection_object|
  #   # binding.pry
  #   sql_users = connection_object.exec("SELECT * FROM users;")
  # end
  # binding.pry
  
  # @users = sql_users.to_a

  @users = User.all

  # binding.pry
  erb :index
end

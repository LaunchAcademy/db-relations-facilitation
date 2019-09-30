require "sinatra"
require "pg"
require "pry" if development? || test?
require "sinatra/reloader" if development?
require_relative "./app/models/user"


set :bind, '0.0.0.0'  # bind to all interfaces
set :views, File.join(File.dirname(__FILE__), "app", "views")

configure :development do
  set :db_config, { dbname: "corn" }
end

configure :test do
  set :db_config, { dbname: "corn" }
end

def db_connection
  begin
    connection = PG.connect(Sinatra::Application.db_config)
    yield(connection)
  ensure
    connection.close
  end
end

get "/users" do

  # sql_users = nil
  # db_connection do |connection_helper|
  #   sql_users = connection_helper.exec("SELECT * FROM users;")
  # end
  #
  # @users = sql_users.to_a

  @users = User.all
  # binding.pry
  erb :index
end

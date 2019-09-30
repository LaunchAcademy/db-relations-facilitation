class User
  attr_accessor :username, :email

  def initialize(username, email)
    @username = username
    @email = email
  end

  def self.all
    sql_users = nil

    db_connection do |connection_helper|
      sql_users = connection_helper.exec("SELECT * FROM users;")
    end

    user_hashes = sql_users.to_a

    users = []
    user_hashes.each do |user_hash|
      users << User.new(user_hash["username"], user_hash["email"])
    end
    binding.pry
    return users
  end

  # def self.create(article_params)
  #
  # end
  #
  # def self.find(id)
  #
  # end

end

class User
  attr_accessor :name, :email

  def initialize(name, email)
    @name = name
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
      users << User.new(user_hash["name"], user_hash["email"])
    end

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

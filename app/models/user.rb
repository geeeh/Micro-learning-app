require 'active_record'

# user model.
class User < ActiveRecord::Base
  has_many :categories

  validates :username, :email, length: {
    maximum: 35,
    too_long: 'must have at least %{count} letters'
  }, uniqueness: true

  validates :password, format: {
    with: /\A[a-zA-Z0-9!@#\$%^&\(\)]+\z/,
    message: "only allows a-z, 0-9 and !@\#$%^&*()"
  }

  def encrypt_password(password)
    BCrypt::Password.create password
  end

  def confirm_password(password, email)
    @user = User.find_by(email: email)
    if @user
      correct_pass = BCrypt::Password.new(@user.password)
      correct_pass.is_password? password
    else
      puts 'user does not exist'
    end
  end

  def create(email, username, password)
    password = encrypt_password password
    @user = User.create(username: username, email: email,
                        password: password)
  end
end

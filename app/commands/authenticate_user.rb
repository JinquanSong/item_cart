class AuthenticateUser
  prepend SimpleCommand

  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    JsonWebToken.encode(user_id: user.id) if user
  end

  private

  attr_accessor :email, :password

  def user
    @user ||= authenticate_user
  end

  def authenticate_user
    user = User.find_by_email(email)
    user && user.authenticate(password) ? user : authentication_failed
  end

  def authentication_failed
    errors.add(:user_authentication, 'invalid credentails')
    nil
  end
end
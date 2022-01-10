class User < ActiveRecord::Base

  has_secure_password


  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 3 }
  validates :password_confirmation, presence: true
  validates :email, uniqueness: { case_sensitive: false }

  # is a class method because it is defined with self.(methodName)
  # would be an instance method if that wasn't there.
  def self.authenticate_with_credentials(email, password)
   user = User.find_by(email: email.strip.downcase)

    if user && user.authenticate(password)
    return user
   else
    return nil
   end
   
  end

end

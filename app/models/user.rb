class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.create_user!(email: nil, password: nil, confirmed: false)
    confirmed_at = (confirmed) ? DateTime.now : nil
    create!(email: email, password: password, password_confirmation: password, confirmed_at: confirmed_at)
  end

end

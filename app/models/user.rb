class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,                presence: true
  validates :email,                   presence: true
  validates :password,                presence: true
  validates :user_name_first,         presence: true
  validates :user_name_last,          presence: true
  validates :user_name_first_reading, presence: true
  validates :user_name_last_reading,  presence: true
  validates :bitthday,                presence: true
  
end

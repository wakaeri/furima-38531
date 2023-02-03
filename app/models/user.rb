class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,                presence: true
  # validates :email,                   presence: true
  # validates :password,                presence: true
  validates :user_name_first,         presence: true
  validates :user_name_last,          presence: true
  validates :user_name_first_reading, presence: true
  validates :user_name_last_reading,  presence: true
  validates :birthday,                presence: true
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, {presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }}
  
  VALID_PASSWORD_REGEX = /\A[a-z\d]{6,}+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX }
  
end

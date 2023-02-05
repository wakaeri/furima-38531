class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :items


  validates :nickname,                presence: true
  validates :birthday,                presence: true
  
  VALID_PASSWORD_REGEX = /\A[a-z0-9]{6,}+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX }


  VALID_USER_NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
  validates :user_name_first,         {presence: true, format: { with: VALID_USER_NAME_REGEX}}
  validates :user_name_last,          {presence: true, format: { with: VALID_USER_NAME_REGEX}}

  VALID_USER_NAME_READING_REGEX = /\A[ァ-ヶー]+\z/
  validates :user_name_first_reading, {presence: true, format: { with: VALID_USER_NAME_READING_REGEX}}
  validates :user_name_last_reading,  {presence: true, format: { with: VALID_USER_NAME_READING_REGEX}}

end

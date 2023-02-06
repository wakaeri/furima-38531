class Item < ApplicationRecord
  belongs_to :user
  # has_one :order
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :days_to_delivery
  
  #ジャンルの選択が「---」の時は保存できないようにする
  validates :category_id,         numericality: { other_than: 1, message: "can't be blank" } 
  validates :status_id,           numericality: { other_than: 1, message: "can't be blank" } 
  validates :delivery_charge_id,  numericality: { other_than: 1, message: "can't be blank" } 
  validates :prefecture_id,       numericality: { other_than: 0, message: "can't be blank" } 
  validates :days_to_delivery_id, numericality: { other_than: 1, message: "can't be blank" } 
  
  validates :item_name,   presence: true
  validates :information, presence: true
  validates :price,       presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is invalid"}
  validates :image,       presence: true
end

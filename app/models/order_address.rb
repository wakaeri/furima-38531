class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id
  
  with_options presence: true do
    validates :category_id,         numericality: { other_than: 1, message: "can't be blank" } 
    validates :status_id,           numericality: { other_than: 1, message: "can't be blank" } 
    validates :delivery_charge_id,  numericality: { other_than: 1, message: "can't be blank" } 
    validates :prefecture_id,       numericality: { other_than: 0, message: "can't be blank" } 
    validates :days_to_delivery_id, numericality: { other_than: 1, message: "can't be blank" } 
    
    validates :item_name,   presence: true
    validates :information, presence: true
    validates :price,       presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is invalid"}
    validates :image,       presence: true


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

  def save
    # 商品購入情報を保存し、変数orderに代入する
    order = Order.create(item_id: item_id, user_id: user_id)
    # 住所を保存する
    # order_idには、変数orderのidと指定する
    Delivery_Address.create(postal_code: postal_code, prefecture_id: prefecture, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
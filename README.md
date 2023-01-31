# DB 設計

## users table

| Column                      | Type        | Options                   |
|---------------------------- |-------------|---------------------------|
| user_name_first             | string      | null: false               |
| user_name_last              | string      | null: false               |
| user_name_first_reading     | string      | null: false               |
| user_name_last_reading      | string      | null: false               |
| nickname                    | string      | null: false               |
| birthday                    | string      | null: false               |
| email                       | string      | null: false, unique: true |
| encrypted_password          | string      | null: false               |
| encrypted_password_confirm  | string      | null: false               |

### Association

* has_many :items
* has_many :orders

## items table

| Column               | Type       | Options                        |
|----------------------|------------|--------------------------------|
| item_name            | text       | null: false                    |
| category             | string     | null: false                    |
| image                | references | null: false, foreign_key: true |
| information          | text       | null: false                    |
| status               | string     | null: false                    |
| delivery_charge      | string     | null: false                    |
| user_area            | string     | null: false                    |
| days_to_delivery     | string     | null: false                    |
| price                | integer    | null: false                    |
| sold                 | string     | null: false                    |
| user                 | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :order
- has_one    :user

## orders table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- has_one    :item
- has_one    :delivery_address
- has_one    :user

## delivery_addresses table

| Column        | Type       | Options                        |
|---------------|------------|--------------------------------|
| postal_code   | string     | null: false                    |
| prefecture    | integer    | null: false                    |
| city          | string     | null: false,                   |
| house_number  | string     | null: false                    |
| building_name | string     | null: false                    |
| phone_number  | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :order
- has_one    :user
- has_one    :item
- has_one    :order
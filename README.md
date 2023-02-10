# DB 設計

## users table

| Column                      | Type        | Options                   |
|---------------------------- |-------------|---------------------------|
| user_name_first             | string      | null: false               |
| user_name_last              | string      | null: false               |
| user_name_first_reading     | string      | null: false               |
| user_name_last_reading      | string      | null: false               |
| nickname                    | string      | null: false               |
| birthday                    | date        | null: false               |
| email                       | string      | null: false, unique: true |
| encrypted_password          | string      | null: false               |

### Association

* has_many :items
* has_many :orders

## items table

| Column               | Type       | Options                        |
|----------------------|------------|--------------------------------|
| item_name            | string     | null: false                    |
| category_id          | integer    | null: false                    |
| information          | text       | null: false                    |
| status_id            | integer    | null: false                    |
| delivery_charge_id   | integer    | null: false                    |
| prefecture_id        | integer    | null: false                    |
| days_to_delivery_id  | integer    | null: false                    |
| price                | integer    | null: false                    |
| user                 | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :order

## orders table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :delivery_address


## delivery_addresses table

| Column           | Type       | Options       |
|------------------|------------|---------------|
| postal_code      | string     | null: false   |
| prefecture_id    | integer    | null: false   |
| city             | string     | null: false   |
| house_number     | string     | null: false   |
| building_name    | string     |               |
| phone_number     | string     | null: false   |
| order            | references | null: false   |

### Association

- belongs_to :order

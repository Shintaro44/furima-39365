# DB 設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| nickname           | string              | null: false, unique: true |
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false, unique: true |
| last_name          | string              | null: false               |
| first_name         | string              | null: false               |
| last_name_kana     | string              | null: false               |
| first_name_kana    | string              | null: false               |
| birthday           | date                | null: false               |


### Association

* has_many :items
* has_many :orders
* has_many :comments

## items table

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| user                                | references | null: false, foreign_key: true |
| name                                | string     | null: false                    |
| description                         | text       | null: false                    |
| category_id                         | integer    | null: false                    |
| item_status_id                      | integer    | null: false                    |
| shipping_cost_id                    | integer    | null: false                    |
| prefecture_id                       | integer    | null: false                    |
| shipping_date_id                    | integer    | null: false                    |
| price                               | integer    | null: false                    |

### Association

- belongs_to :user
- has_one :order
- has_many :comments

## orders table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| user        | text       | null: false                    |
| item        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :payment

## payments table

| Column        | Type       | Options                        |
|---------------|------------|--------------------------------|
| orders        | text       | null: false                    |
| postcode      | references | null: false, foreign_key: true |
| prefecture_id | references | null: false, foreign_key: true |
| city          | text       | null: false                    |
| block         | text       | null: false                    |
| building      | text       | null: false                    |
| phone_number  | text       | null: false                    |

### Association

- belongs_to :order

## comments table

| Column        | Type       | Options                        |
|---------------|------------|--------------------------------|
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |
| text          | text       | null: false                    |

### Association

- belongs_to :user
- belongs_to :item

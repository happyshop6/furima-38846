## users テーブル

| Column              | Type   | Options                 |
| ------------------  | ------ | ----------------------- |
| nickname            | string | null: false             |
| email               | string | null: false,unique: true|
| encrypted_password  | string | null: false             |
| first_name          | string | null: false             |
| family_name         | string | null: false             |
| read_first          | string | null: false             |
| read_family        | string | null: false              |
| birth               | date   | null: false             |

### Association

- has_many :products
- has_many :item_purchases

##  productsテーブル

| Column               | Type       | Options                        |
| -------------------  | ------     | ------------------------------ |
| name                 | string     | null: false                    |
| explanation          | text       | null: false                    |
| category_id          | integer    | null: false                    |
| condition_id         | integer    | null: false                    |
| postage_type_id      | integer    | null: false                    |
| prefecture_id        | integer    | null: false                    |
| preparation_day_id   | integer    | null: false                    |
| price                | integer    | null: false                    |
| user                 | references | null: false, foreign_key: true | 

### Association

- belongs_to :user
- has_one :item_purchase

## item_purchases テーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| product       | references | null: false, foreign_key: true |
| user          | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :product
- has_one :purchases_info

## purchases_infos テーブル

| Column        | Type        | Options                        |
| ------------- | ----------  | ------------------------------ |
| phone_number  | string      | null: false                    |
| postal_code   | string      | null: false                    |
| city          | string      | null: false                    |
| address       | string      | null: false                    |
| prefecture_id | integer     | null: false                    |
| building_name | string      |                                |
| item_purchase | references  | null: false, foreign_key: true |


### Association

- belongs_to  :item_purchase
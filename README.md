## users テーブル

| Column              | Type   | Options     |
| ------------------  | ------ | ----------- |
| nickname            | string | null: false |
| email               | string | null: false |
| encrypted_password  | string | null: false |
| first_name          | string | null: false |
| family_name         | string | null: false |
| read_first          | string | null: false |
| read_family         | string | null: false |

### Association

- has_many :products
- has_many :item_purchases

##  productsテーブル

| Column              | Type       | Options     |
| ------------------  | ------     | ----------- |
| photo               | text       | null: false |
| name                | string     | null: false |
| explanation         | text       | null: false |
| category            | integer    | null: false |
| condition           | integer    | null: false |
| postage_type        | integer    | null: false |
| prefectures         | integer    | null: false |
| preparation_days    | integer    | null: false |
| value               | integar    | null: false |
| user                | references | null: false | 

### Association

- belongs_to :user
- has_one :item_purchase

## item_purchases テーブル
| Column        | Type    | Options                        |
| ------------- | ------- | ------------------------------ |
| product       | integer | null: false, foreign_key: true |
| user          | integer | null: false, foreign_key: true |
| purchase_info | integer | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product
- belongs_to :purchase_info

## purchase_info テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefectures   | integer    | null: false, foreign_key: true |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| phone_number  | string     | null: false                    |
| item_purchase | integer    | null: false, foreign_key: true |

### Association

- has_one :item_purchase
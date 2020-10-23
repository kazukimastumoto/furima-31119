
テーブル設計

users テーブル

|  Column                   | Type    | Options     |
| ------------------------- | ------- | ----------- |
| email                     | string  | null: false |
| password                  | string  | null: false |
| nickname                  | string  | null: false |
| first_name                | string  | null: false |
| last_name                 | string  | null: false |
| identification_first_name | string  | null: false |
| identification_last_name  | string  | null: false |
| birthday                  | integer | null: false |

Association
- has_many :items
- has_many :orders
- has_one :shipping



itemsテーブル

|  Column                   | Type     | Options     |
| ------------------------- | -------- | ----------- |
| item_name                 | string   | null: false |
| price                     | integer  | null: false |
| description               | text     | null: false |
| category                  | string   | null: false |
| status                    | string   | null: false |
| delivery_charge           | integer  | null: false |
| delivery_day              | integer  | null: false |
| user                      |reference | null: false |

Association
- belongs_to :user
- has_one :order


ordersテーブル

|  Column                   | Type      | Options     |
| ------------------------- | --------- | ----------- |
| comment                   | text      | null: false |
| card_number               | integer   | null: false |
| term                      | integer   | null: false |
| security                  | integer   | null: false |
| user                      | reference | null: false |
| item                      | reference | null: false |

Association
- belongs_to :user
- belongs_to :item
- has_one :shipping




shippingsテーブル

  Column                    | Type      | Options      |
| ------------------------- | --------- | -----------  |
| postal_code               | integer   | null: false  |
| prefectures               | string    | null: false  |
| city                      | string    | null: false  |
| address                   | integer   | null: false  |
| building_name             | string    | null: false  |
| cellphone number          | integer   | null: false  |
| user                      | reference | null: false  |
| order                     | reference | null: false  |


Association
belongs_to user
belongs_to order

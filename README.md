
テーブル設計

users テーブル

|  Column                   | Type    | Options     |
| ------------------------- | ------- | ----------- |
| email                     | string  | null: false |
| encrypted_password        | string  | null: false |
| nickname                  | string  | null: false |
| first_name                | string  | null: false |
| last_name                 | string  | null: false |
| first_name_kana           | string  | null: false |
| last_name_kana            | string  | null: false |
| birthday                  | date    | null: false |

Association
- has_many :items
- has_many :orders



itemsテーブル

|  Column                   | Type      | Options     |
| ------------------------- | --------- | ----------- |
| name                      | string    | null: false |
| price                     | integer   | null: false |
| description               | text      | null: false |
| category_id               | integer   | null: false |
| status_id                 | integer   | null: false |
| delivery_charge_id        | integer   | null: false |
| shipping_area_id          | integer   | null: false |
| delivery_day_id           | integer   | null: false |
| user                      |references | null: false |

Association
- belongs_to :user
- has_one :order


ordersテーブル

|  Column                   | Type       | Options     |
| ------------------------- | ---------- | ----------- |
| user                      | references | null: false |
| item                      | references | null: false |

Association
- belongs_to :user
- belongs_to :item
- has_one :shipping




shippingsテーブル

  Column                    | Type       | Options      |
| ------------------------- | ---------- | -----------  |
| postal_code               | string     | null: false  |
| prefectures_id            | integer    | null: false  |
| city                      | string     | null: false  |
| address                   | string     | null: false  |
| building_name             | string     |              |
| cellphone number          | string     | null: false  |
| order                     | references | null: false  |


Association
belongs_to order

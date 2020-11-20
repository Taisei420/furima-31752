#テーブル設計

## users テーブル

| Column                | Type   | Options     |
| --------------------- | -------| ----------- |
| nickname              | string | null: false |
| email                 | string | null: false |
| encrypted_password    | string | null: false |
| last_name             | string | null: false |
| first_name            | string | null: false |
| kana_last_name        | string | null: false |
| kana_first_name       | string | null: false |
| birthday              | date   | null: false |

###Association
- has_many: items
- has_many: purchases

## items テーブル

| Column              | Type     | Options     |
| ------------------- | -------- | ----------- |
| product_name        | string   | null: false |
| product_description | text     | null: false |
| category_id         | integer  | null: false |
| condition_id        | integer  | null: false |
| shipping.charges_id | integer  | null: false |
| shipping.area_id    | integer  | null: false |
| shipping.day_id     | integer  | null:false  |
| price               | integer  | null:false  |

###Association
- belongs_to: users
- has_one: purchase

## address テーブル

| Column          | Type       | Options                       |
|---------------- |------------|-------------------------------|
| potal.code_id   | integer    | null: false                   |
| prefectures_id  | integer    | null: false                   |
| municipality    | string     | null: false                   |
| block           | string     | null: false                   |
| building_number | string     |                               |
| phone_number    | string     | null: false                   |
| purchase        | references | null:false, foreign_key: true |


###Association
- belongs_to: purchase

# purchase テーブル

| Column             | Type       | Options                        |
|--------------------| -----------|--------------------------------|
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

###Association
- belongs_to: users
- has_one: address
- belongs_to: items



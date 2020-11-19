#テーブル設計

## users テーブル

| Column                | Type   | Options     |
| --------------------- | -------| ----------- |
| nickname              | string | null: false |
| email                 | string | null: false |
| encrypted_password    | string | null: false |
| encrypted_password    | string | null: false |
| last_name             | string | null: false |
| first_name            | string | null: false |
| kana_last_name        | string | null: false |
| kana_first_name       | string | null: false |
| birthday              | date   | null: false |

###Association
- has_many: items
- has_many: purchase
- has_one: address

## items テーブル

| Column              | Type     | Options     |
| ------------------- | -------- | ----------- |
| product_name        | string   | null: false |
| product_description | text     | null: false |
| category            | integer  | null: false |
| condition           | integer  | null: false |
| shipping_charges    | integer  | null: false |
| shipping_area       | integer  | null: false |
| shipping_day        | integer  | null:false  |
| price               | interger | null:false  |

###Association
- belongs_to: users
- has_one: purchase

## address テーブル

| Column          | Type   | Options     |
|---------------- |--------|-------------|
| potal_code      | string | null: false |
| prefectures     | string | null: false |
| municipality    | string | null: false |
| block           | string | null: false |
| building_number | string | null: false |
| phone_number    | string | null: false |


###Association
- belongs_to: purchase

# purchase テーブル

| Column             | Type       | Options                        |
|--------------------| -----------|--------------------------------|
| user_id            | references | null: false, foreign_key: true |
| item_id            | references | null: false, foreign_key: true |

###Association
- belongs_to: users
- has_one: address
- belongs_to: items



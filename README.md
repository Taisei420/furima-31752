#テーブル設計

## users テーブル

| Column                | Type   | Options     |
| --------------------- | -------| ----------- |
| nickname              | string | null: false |
| email                 | string | null: false |
| password              | string | null: false |
| password-confirmation | string | null: false |
| last_name             | string | null: false |
| first_name            | string | null: false |
| kana_last_name        | string | null: false |
| kana_first_name       | string | null: false |
| birthday              | string | null: false |

###Association
- has_many: items
- has_many: purchase
- has_one: address

## items テーブル

| Column              | Type     | Options     |
| ------------------- | -------- | ----------- |
| product_name        | string   | null: false |
| product_description | string   | null: false |
| category            | string   | null: false |
| condition           | string   | null: false |
| shipping_charges    | string   | null: false |
| shipping_area       | string   | null: false |
| shipping_day        | datetime | null:false  |
| price               | interger | null:false  |

###Association
- belongs_to: users
- has_one: purchase

## address テーブル

| Column       | Type   | Options     |
|--------------|--------|-------------|
| potal_code   | string | null: false |
| prefectures  | string | null: false |
| municipality | string | null: false |
| block        | string | null: false |

###Association
- belongs_to: purchase
- belongs_to: users

# purchase テーブル

| Column             | Type     | Options     |
|--------------------| ---------|-------------|
| credit_card_number | interger | null: false |
| expiration_date    | interger | null: false |
| security_code      | interger | null: false |
| phone_number       | interger | null: false |

###Association
- belongs_to: users
- has_one: address
- belongs_to: items



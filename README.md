# テーブル設計

## users テーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| nickname            | string | null: false |
| email               | string | null: false |
| password            | string | null: false |
| first_name          | string | null: false |
| last_name           | string | null: false |
| first_name_hurigana | string | null: false |
| last_name_hurigana  | string | null: false |
| birthday            | string | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column             | Type       | Options                        |
| -------------------| ---------- | ------------------------------ |
| trade_name         | string     | null: false                    |
| explanation        | text       | null: false                    |
| category           | string     | null: false                    |
| status             | string     | null: false                    |
| shipping_charge    | string     | null: false                    |
| shipping_from_area | string     | null: false                    |
| days_to_ship       | string     | null: false                    |
| price              | string     | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchases

## purchases テーブル

| Column           | Type           | Options                        |
| -----------------| -------------- | ------------------------------ |
| card_number      | string         | null: false                    |
| expiration_month | string         | null: false                    |
| expiration/year  | string         | null: false                    |
| security_code    | string         | null: false                    |
| user             | references     | null: false, foreign_key: true |
| item             | references     | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address

## shipping_addresses

| Column        | Type       | Options                        |
| --------------| ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture    | string     | null: false                    |
| municipality  | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| purchase      | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase
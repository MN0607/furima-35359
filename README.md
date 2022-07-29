# テーブル設計

## users テーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| nickname            | string | null: false |
| email               | string | null: false |
| encrypted_password  | string | null: false |
| first_name          | string | null: false |
| last_name           | string | null: false |
| first_name_hurigana | string | null: false |
| last_name_hurigana  | string | null: false |
| birthday            | date   | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| trade_name            | string     | null: false                    |
| explanation           | text       | null: false                    |
| category_id           | integer    | null: false                    |
| status_id             | integer    | null: false                    |
| shipping_charge_id    | integer    | null: false                    |
| prefecture_id         | integer    | null: false                    |
| days_to_ship_id       | integer    | null: false                    |
| price                 | integer    | null: false                    |
| user                  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order
- has_many :item_tag_relations
- has_many :tags, through: item_tag_relations

## orders テーブル

| Column           | Type           | Options                        |
| -----------------| -------------- | ------------------------------ |
| user             | references     | null: false, foreign_key: true |
| item             | references     | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address

## addresses

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postal_code      | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| municipality     | string     | null: false                    |
| house_number     | string     | null: false                    |
| building_name    | string     |                                |
| phone_number     | string     | null: false                    |
| order            | references | null: false, foreign_key: true |

### Association

- belongs_to :order

## tags

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| tag_name         | string     | null: false, uniqueness: true  |

### Association

- has_many :item_tag_relations
- has_many :items, through: item_tag_relations

## item_tag_relations

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| item             | reference  | null: false                    |
| tag              | reference  | null: false                    |

### Association

- belongs_to :item
- belongs_to :tag
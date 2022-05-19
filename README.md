## users テーブル

| Column                | Type   | Options                   |
| ------------------    | ------ | ------------------------- |
| nickname              | string | null: false               |
| email                 | string | null: false, unique: true |
| encrypted_password    | string | null: false               |
| last_name             | string | null: false               |
| first_name            | string | null: false               |
| last_name_katakana    | string | null: false               |
| first_name_katakana   | string | null: false               |
| birthday              | date   | nill: false               |

### Association

* has_many :items
* has_many :purchases

## items テーブル

| Column                     | Type        | Options         |
| ---------------------------| ----------- | ----------------|
| title                      | string      | null: false     |
| content                    | text        | null: false     |
| category_id                | integer     | null: false     |
| situation_id               | integer     | null: false     |
| burden_of_shipping_charge_id| integer    | null: false     |
| prefecture_id              | integer     | null: false     |
| shipping_day_id            | integer     | null: false     |
| price                      | integer     | null: false     |
| user                       | references  |foreign_key: true|

### Association

* belongs_to :user
* has_one :purchase

## purchases 　テーブル

| Column             | Type        | Options         |
| ------------------ | ----------- | ----------------|
| user               | references  |foreign_key: true|
| item               | references  |foreign_key: true|

### Association
* belongs_to :user
* belongs_to :item
* has_one :address

## addresses テーブル

| Column             | Type        | Options                      |
| ------------------ | ----------- | ---------------------------- |
| postal_code        | string      | null: false                  |
| prefecture_id      | integer      | null: false                  |
| municipalities     | string      | null: false                  |
| address            | text        | null: false                  |
| building_name      | string      |                              |
| telephone_number   | string      | null: false                  |
| purchase           | references  | null: false foreign_key: true|

### Association
* belongs_to :purchase

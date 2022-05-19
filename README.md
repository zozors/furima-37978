## users テーブル

| Column                | Type   | Options                   |
| ------------------    | ------ | ------------------------- |
| nickname              | string | null: false               |
| email                 | string | null: false、unique: true |
| password_confirmation | string | null: false               |
| last_name             | string | null: false               |
| first_name            | string | null: false               |
| last_name_katakana    | string | null: false               |
| first_name_katakana   | string | null: false               |
| birthday              | date   | nill: false               |

### Association

* has_many :items
* has_many :transactions

## items テーブル

| Column                     | Type        | Options         |
| ---------------------------| ----------- | ----------------|
| title                      | string      | null: false     |
| content                    | text        | null: false     |
| category_id                | string      | null: false     |
| situation_id               | string      | null: false     |
| burden_of_shipping_charge_id| string      | null: false     |
| prefecture_id              | string      | null: false     |
| shipping_day_id            | integer     | null: false     |
| price                      | integer     | null: false     |
| user                       | references  |foreign_key: true|

### Association

* belongs_to :user
* has_one :transactions

## transactions 　テーブル

| Column             | Type        | Options         |
| ------------------ | ----------- | ----------------|
| user               | references  |foreign_key: true|
| item               | references  |foreign_key: true|

### Association
* belongs_to :users
* belongs_to :items
* has_one :addresses

## addresses テーブル

| Column             | Type        | Options         |
| ------------------ | ----------- | --------------- |
| postal code        | string      | null: false     |
| prefecture         | string      | null: false     |
| municipalities     | string      | null: false     |
| address            | text        | null: false     |
| building name      | string      |                 |
| telephone number   | string      | null: false     |
| transaction        | references  | null: false foreign_key: true|

### Association
* belongs_to :transactions

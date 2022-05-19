## users テーブル

| Column                | Type   | Options                   |
| ------------------    | ------ | ------------------------- |
| nickname              | string | null: false               |
| email                 | string | null: false、unique: true |
| password              | string | null: false               |
| password_confirmation | string | null: false               |
| first_name            | string | null: false               |
| last_name             | string | null: false               |
| date                  | string | nill: false               |

## items テーブル

| Column                     | Type        | Options         |
| ---------------------------| ----------- | ----------------|
| title                      | string      | null: false     |
| content                    | text        | null: false     |
| category                   | string      | null: false     |
| situation                  | string      | null: false     |
| burden of shipping charges | string      | null: false     |
| shipping area              | string      | null: false     |
| shipping day               | integer     | null: false     |
| user_id                    | references  |foreign_key: true|

## transactions 　テーブル

| Column             | Type        | Options         |
| ------------------ | ----------- | ----------------|
| buyer              | string      | null: false     |
| title              | string      | null: false     |
| user               | references  |foreign_key: true|
| item               | references  |foreign_key: true|

## addresses テーブル

| Column             | Type        | Options         |
| ------------------ | ----------- | --------------- |
| postal code        | string      | null: false     |
| shipping area      | string      | null: false     |
| municipalities     | string      | null: false     |
| address            | text        | null: false     |
| building name      | string      |                 |
| telephone number   | string      | null: false     |
| transaction        | references  |foreign_key: true|

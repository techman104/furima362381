# README
フリマアプリの構造
# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string |
| encrypted_password | string | null: false |
| name full_width    | text   | null: false |
| name kana full_width| text   | null: false |
| date           | text   | null: false |
## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| image           | string | null: false |
| title           | text   | null: false |
| product introduction| text   | null: false |
| product condition| references   | |
| category         | string | null: false |
| delivery fee    | text   | null: false |
| shipping area   | text   | null: false |
| date until shipping| references   | |
| price           | references   | |
## Purchase record テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| card information    | integer | null: false |
| date of expiry      | references |  |
| security code       | references |  |

## addles テーブル
| Column | Type   | Options     |
| ------ | ------ | ----------- |
| postal code           | string | null: false |
<!-- | prefectures      | text   | null: false | -->
| municipalities         | string   | null: false |
| addles            | string   | |
| building name           | string |
| telephone number      | string   | null: false |
# README
フリマアプリの構造
# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| password           | string | null: false |
| password reconfirmation     | text   | null: false |
| name full-width    | text   | null: false |
| name kana full-width| text   | null: false |
| birthday           | text   | null: false |
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
## buy テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| card information    | text | null: false, |
| date of expiry      | references |  |
| security code       | references |  |

## addles テーブル
| Column | Type   | Options     |
| ------ | ------ | ----------- |
| postal code           | string | null: false |
| prefectures      | text   | null: false |
| municipalities         | text   | null: false |
| addles            | references   | |
| building name           | string | null: false |
| telephone number      | text   | null: false |
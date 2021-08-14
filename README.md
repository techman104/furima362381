# README
フリマアプリの構造
# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| family_name        | string | null: false |
| first_name         | string | null: false |
| family_name_kana   | string | null: false |
| first_name_kana    | string | null: false |
| email              | string | null: false,unique:true |
| encrypted_password | string | null: false |
| birth_day          | date   | null: false |

Association
has_many :items

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name                  | string    | null: false |
| text                  | text      | null: false |
| category_id           | integer   | null: false,FK:true |
| condition_id          | integer   | null: false |
| shipping_charge_id    | integer   | null: false |
| shipping_area_id      | integer   | null: false |
| day_id                | integer   | null: false |
| price                 | integer   | null: false |

Association
belongs_to:user

## Purchase_records テーブル
userテーブル
|購入情報(外部キー)|
|A00001         |
|A00002         |
|A00003         |

itemsテーブル
｜購入情報（外部キー）
｜A000001        
|A000002        
|A000003         
## addresses テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| user               | references | null: false,FK:true |
| zip_code           | string | null: false,unique:true |
| shipping_area_id   | integer| null: false | 
| city               | string | null: false |
| addles1            | string | null: false |
| addles2            | string | 
| telephone          | string | unique:true |
| purchase_record    | references |
Association
belongs_to:user
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
belongs_to:addres
has_many :item
belongs_to:Purchase_record

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name                  | string    | null: false |
| text                  | text      | null: false |
| category_id           | integer   | null: false,|
| condition_id          | integer   | null: false |
| shipping_charge_id    | integer   | null: false |
| shipping_area_id      | integer   | null: false |
| day_id                | integer   | null: false |
| price                 | integer   | null: false |

Association
belongs_to:user
belongs_to:Purchase_record
## Purchase_records テーブル
| Column             | Type       | Options     |  
| user               | references | null: false,foreign_key: true |
|item                | references | null: false,foreign_key: true |

Association
belongs_to:user
belongs_to:item
belongs_to:addres

## addresses テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| zip_code           | string | null: false |
| shipping_area_id   | integer| null: false | 
| city               | string | null: false |
| addles1            | string | null: false |
| addles2            | string |
| telephone          | string | unique:true |
| Purchase_record    | references | null: false,foreign_key: true |

Association
belongs_to:user
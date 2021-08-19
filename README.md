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
| birthday           | date   | null: false |

Association
has_many :items
has_one :addles dependent: :destroy

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name                  | string    | null: false |
| text                  | text      | null: false |
| category_id           | references| null: false,FK:true |
| condition             | integer   | null: false |
| shipping charges      | string    | null: false |
| shipping area         | string    | null: false |
| days                  | datetime  | null: false |
| price                 | integer   | null: false |

Association
belongs_to:user

## Purchase record テーブル
userテーブル
|購入情報(外部キー)|
|A00001         |
|A00002         |
|A00003         |

itemsテーブル
｜購入情報（外部キー）｜商品名
｜A000001        ｜マグカップ｜
|A000002         |熊の人情  |
|A000003         |炊飯器    |
## addles テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| user_id            | references | null: false,FK:true |
| family_name        | string | null: false |
| first_name         | string | null: false |
| family_name_kana   | string | null: false |
| first_name_kana    | string | null: false |
| zip_code           | integer| null: false,unique:true |
| shipping area      | string | null: false | 
| city               | string | null: false |
| addles1            | string | null: false |
| addles2            | string | 
| telephone          | integer| unique:true |

Association
belongs_to:user
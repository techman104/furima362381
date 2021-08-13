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
| birth_year         | string | null: false |
| birth_month        | string | null: false |


Association
has_many :items
has_one :addles dependent: :destroy

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| category_id           | references| null: false,FK:true |
| shipping_id           | references| null: false,FK:true |
| brand_id              | references| null: false,FK:true |
| seller_user_id        | references| null: false,FK:true |
| name                  | string    | null: false |
| text                  | text      | null: false |
| condition             | integer   | null: false |
| trading_status        | integer   | null: false |
| price                 | integer   | null: false |
| completed_at          | datetime  |

Association
belongs_to:user
belongs_to:category
has_many :item_images dependent: :destroy

## item_images テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| item_id| references| null: false,FK:true |
| image_url | string | null: false |

Association
belongs_to :item
## Purchase record テーブル
userテーブル
| user情報（主キー)|購入情報(外部キー)|
|100001          |A00001         |
|100002          |A00002         |
|100003          |A00003         |

itemsテーブル
｜購入情報（主キー）｜商品名
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
| zip_code           | integer | null: false,unique:true |
| prefecture         | string | null: false |
| city               | string | null: false |
| addles1            | string | null: false |
| addles2            | string |
| telephone          | string | unique:true |

Association
belongs_to:user
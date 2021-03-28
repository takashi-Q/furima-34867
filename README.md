## users テーブル
|             Column          | Type   | Options     |
|             --------        | ------ | ----------- |
|             name            | string | null: false |
|             email           | string | null: false |
|          encrypted_password | string | null: false |
|             first_name      | string | null: false |
|             last_name       | string | null: false |
|            first_name_kana  | string | null: false |
|           last_name_kana    | string | null: false |
|             date            | string | null: false |

Association
has_many :items

## items テーブル

| Column       |  Type       | Options     |
| -----------  |  -----------|  ---------- |
| product_name |  string     | null: false |
| description  |  text       | null: false |
| category     |  string     | null: false |
| status       |  string     | null: false |
| price        |  integer    | null: false |
| exhibitor    |  string     | null: false |
|

Association
has_one:purchaser

### purchaserテーブル

| Column      |  Type       | Options     |
| ----------- |  -----------|  ---------- |
| name        |  string     | null: false |
| bought_item |  string     | null: false |

Association
belongs_to:items

## mailing adressテーブル

| Column       |  Type       | Options     |
| -----------  |  -----------|  ---------- |
| postal_code  |  string     | null: false |
| manicipality |  string     | null: false |
| adress       |  string     | null: false |
| building_name|  string     | null: false | 
| telephone    |  integer    | null: false |
t.references :user, foreign_key: true

Association
has_many :items


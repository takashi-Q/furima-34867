## users テーブル
|             Column          | Type   | Options                 |
|             --------        | ------ | -----------             |
|             name            | string | null: false             |
|             email           | string | null: false unique: true|
|          encrypted_password | string | null: false             |
|             first_name      | string | null: false             |
|             last_name       | string | null: false             |
|            first_name_kana  | string | null: false             |
|           last_name_kana    | string | null: false             |
|             date            | date   | null: false             |

Association
has_many :items
has_many :purchasers


## items テーブル

| Column          |  Type       |            Options                     |
| -----------     |  -----------|          ----------                    |
| product_name    |  string     |          null: false                   |
| description     |  text       |          null: false                   |
| category_id     |  integer    |          null: false                   |
| status_id       |  integer    |          null: false                   |
| burden_id       |  integer    |          null: false                   |
| area_id         |  integer    |          null: false                   |
| days_ship_id    |  integer    |          null: false                   |
| price           |  integer    |          null: false                   |
| user            |  references |      foreign_key: true                 |    

Association
belongs_to:user
has_one:purchaser



### purchasersテーブル

| Column      |  Type       |  Options           |
| ----------- |  -----------|  ----------        |
| user_id     |  integer    |  foreign_key: true |
| item_id     |  integer    |  foreign_key: true |

Association
belongs_to:item
belongs_to:user
has_one:mailing_adress


## ordersテーブル

| Column       |  Type       | Options            
| -----------  |  -----------|  ----------       |
| postal_code  |  string     | null: false       |
| area_id      |  integer    | null: false       |
| municipality |  string     | null: false       |
| adress       |  string     | null: false       |
| building_name|  string     | ----------        | 
| telephone    |  string     | null: false       |
| purchaser    |  references | foreign_key: true |


Association
belongs_to :purchaser



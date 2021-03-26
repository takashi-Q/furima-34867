## users テーブル
|             Column          | Type   | Options     |
|             --------        | ------ | ----------- |
|             name            | string | null: false |
|             email           | string | null: false |
|             password        | string | null: false |
|             password second | string | null: false |
|             first name      | string | null: false |
|             second name     | string | null: false |
|             first name kana | string | null: false |
|             last name kana  | string | null: false |
|             year            | string | null: false |
|             month           | string | null: false |
|             day             | string | null: false |

## items テーブル

| Column       |  Type       | Options     |
| -----------  |  -----------|  ---------- |
| product name |  text       | null: false |
| description  |  text       | null: false |
| status       |  string     | null: false |
| price        |  string     | null: false |
| exhibitor    |  string     | null: false |

### purchaserテーブル

| Column      |  Type       | Options     |
| ----------- |  -----------|  ---------- |
| name        |  text       | null: false |
| name        |  buy       |  null: false |

## mailing adressテーブル

| Column       |  Type       | Options     |
| -----------  |  -----------|  ---------- |
|  name        |  string     | null: false |
| postal code  |  string     | null: false |
| pref         |  string     | null: false |
| manicipality |  string     | null: false |
| adress       |  string     | null: false |
| building name|  string     |             | 
| telephone    |  string     |  ---------- |

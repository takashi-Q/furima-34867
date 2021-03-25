## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| year     | string | null: false |
| month    | string | null: false |
| day      | string | null: false |

## items テーブル

| Column       |  Type       | Options     |
| -----------  |  -----------|  ---------- |
| product name |  string     | null: false |
| category     |  string     | null: false |
| price        |  string     | null: false |

### purchaserテーブル

| Column      |  Type       | Options     |
| ----------- |  -----------|  ---------- |
| address      |  text       | null: false |
<!-- | catch_copy  |  text       | null: false |
| concept     |  text       | null: false |
| user        |  references | ----------- | -->

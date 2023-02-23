# usersテーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |

- has_many :dishes
- has_many :genres


# dishesテーブル

| Column      | Type       | Options                         |
| ----------- | ---------- | ------------------------------- |
| dish_name   | string     | null: false                     |
| url         | string     |                                 |
| user        | references | null: false,  foreign_key: true |
| genre       | references | foreign_key: true               |

- belongs_to :user
- belongs_to :genre
- has_many :materials
_ has_many :dates


# genresテーブル

| Column   | Type       |                                |
| -------- | ---------- | ------------------------------ |
| name     | string     | null: false                    |
| user     | references | null: false, foreign_key: true |

- has_many :dishes
- belongs_to :user



# materialsテーブル（材料）

| Column   | Type       |                                |
| -------- | ---------- | ------------------------------ |
| name     | string     | null: false                    |
| dish     | references | null: false, foreign_key: true |

- belongs_to :dish


# datesテーブル（作った日）

| Column   | Type       |                                |
| -------- | ---------- | ------------------------------ |
| ate_date | date       | null: false                    |
| dish     | references | null: false, foreign_key: true |

- has_many :dishes

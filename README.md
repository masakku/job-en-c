# README

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | --------------------------|
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| name_kana          | string | null: false               |
| profile            | string | null: false               |
| position           | string | null: false               |
| occupation         | string | null: false               |


### Association

- has_many :messages
- has_many :matters
- has_many :rooms, through: :room_users
- has_many :room_users


## matters テーブル

| Column                  | Type      | Options                                      |
| ----------------------- | --------- | -------------------------------------------- |
| title                   | string    | null: false                                  |
| info                    | text      | null: false                                  |
| genre_id                | integer   | null: false                                  |
| scheduled_id            | integer   | null: false                                  |
| detail                  | text      | null: false                                  |
| price                   | integer   | null: false                                  |
| user                    | references| null: false, foreign_key: true               |

### Association

- belongs_to :user
- belongs_to :genre
- belongs_to :scheduled


## rooms テーブル

| Column                  | Type      | Options                                      |
| ----------------------- | --------- | -------------------------------------------- |
| name                    | string    | null: false                                  |

### Association

- has_many :room_users
- has_many :users, through: :room_users
- has_many :messages


## room_users テーブル

| Column                  | Type      | Options                                      |
| ----------------------- | --------- | -------------------------------------------- |
| user                    | references| null: false, foreign_key: true               |
| room                    | references| null: false, foreign_key: true               |

- belongs_to :user
- belongs_to :room


## messages テーブル

| Column                  | Type      | Options                                      |
| ----------------------- | --------- | -------------------------------------------- |
| user                    | references| null: false, foreign_key: true               |
| room                    | references| null: false, foreign_key: true               |
| message                 | string    |                                              |

- belongs_to :user
- belongs_to :room

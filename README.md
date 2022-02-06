# README

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | --------------------------|
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| name_kana          | string | null: false               |
| profile            | string | null: false               |
| career             | string | null: false               |
| position           | string | null: false               |
| occupation         | string | null: false               |


### Association

- has_many :room_messages
- has_many :items
- has_many :rooms, through: :room_matter_users


## matters テーブル

| Column                  | Type      | Options                                      |
| ----------------------- | --------- | -------------------------------------------- |
| title                   | string    | null: false                                  |
| info                    | text      | null: false                                  |
| category_id             | integer   | null: false                                  |
| scheduled_id            | integer   | null: false                                  |
| detail                  | text      | null: false                                  |
| price                   | integer   | null: false                                  |
| user                    | references| null: false, foreign_key: true               |

### Association

- belongs_to :user
- has_many :rooms, through: :room_matter_users
- belongs_to :category
- belongs_to :scheduled


## rooms テーブル

| Column                  | Type      | Options                                      |
| ----------------------- | --------- | -------------------------------------------- |
| id                      | integer   | null: false                                  |

### Association

- has_many :room_messages
- has_many :users, through: :room_matter_users
- has_many :matters, through: :room_matter_users


## room_matter_users テーブル

| Column                  | Type      | Options                                      |
| ----------------------- | --------- | -------------------------------------------- |
| user                    | references| null: false, foreign_key: true               |
| room                    | references| null: false, foreign_key: true               |
| matter                  | references| null: false, foreign_key: true               |

- belongs_to :user
- belongs_to :matter
- belongs_to :room


## room_messages テーブル

| Column                  | Type      | Options                                      |
| ----------------------- | --------- | -------------------------------------------- |
| user                    | references| null: false, foreign_key: true               |
| room                    | references| null: false, foreign_key: true               |
| message                 | string    | null: false                                  |

- belongs_to :user
- belongs_to :room

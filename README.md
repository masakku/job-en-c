# README

# アプリ名

 ## JOB EN C

# 概要

ビジネスをされているユーザーの方々向けのビジネスマッチングアプリです。案件投稿機能と、投稿されてある
案件に興味があるユーザーと案件依頼したユーザーが直接やり取りができるようなチャット機能があります。


# 本番環境

https://job-en-c.herokuapp.com/

# 制作背景（意図）

Job　Encounter　Chance  
仕事の出会いをチャンスとして捉えて頂ければと思い、アプリ名を考えました。  
経営者・フリーランスの方や、副業されている方などが業務委託できる関係構築や、案件獲得の支援をが出来る
ようなアプリを作成したいと考えて制作したのが背景になっております。

# DEMO
### トップページ
[![Image from Gyazo](https://i.gyazo.com/34e1022e2e036152dbd834ab004b943f.gif)](https://gyazo.com/34e1022e2e036152dbd834ab004b943f)
ユーザーの方々にどういった案件が投稿してあるかを確認していただくことが出来ます。


### ユーザー新規登録画面
[![Image from Gyazo](https://i.gyazo.com/503e49055315f881ed1290310869c395.gif)](https://gyazo.com/503e49055315f881ed1290310869c395)
ユーザーの新規登録・ログインやログアウトをすることが出来ます。

### 案件投稿機能
[![Image from Gyazo](https://i.gyazo.com/d0f0994d9e0771fddbe36dba9a9daeea.gif)](https://gyazo.com/d0f0994d9e0771fddbe36dba9a9daeea)
ログインしているユーザーの方々が、案件を投稿することが出来ます。

### 案件詳細ページ
案件投稿者自身の投稿詳細画面
[![Image from Gyazo](https://i.gyazo.com/7848dd31339c7810462b8587efa59e4c.gif)](https://gyazo.com/7848dd31339c7810462b8587efa59e4c)
ユーザーの案件詳細画面
[![Image from Gyazo](https://i.gyazo.com/9d2adf7e1d06666e6b75e0d0015bb3ec.gif)](https://gyazo.com/9d2adf7e1d06666e6b75e0d0015bb3ec)
案件投稿者の方は、自身で投稿した案件の詳細確認が出来ます。また案件に対して興味がある方からの通知を確認でき、直接DMができるようになっております。  
登録ユーザーの方々は、興味がある案件に対してDMができるようになっています。
  

### 案件編集・削除画面
[![Image from Gyazo](https://i.gyazo.com/a617e335acc59adbc1e196a0219cf05d.gif)](https://gyazo.com/a617e335acc59adbc1e196a0219cf05d)
案件の編集・削除が出来ます。

### 投稿者と案件申込ユーザー同士のチャットルーム（未完成）
[![Image from Gyazo](https://i.gyazo.com/6cd8ed24e5346ed257dffe6a0a4d5fd4.gif)](https://gyazo.com/6cd8ed24e5346ed257dffe6a0a4d5fd4)
まだ、チャットルーム機能は未完成となっていますが画面遷移の流れとViewはこういった形になります。

# 実装予定の内容
今後の実装予定に関しては、  
### ①チャットルーム機能完成
チャットルーム画面の左側に、現在やりとりしているユーザー名一覧を表示する。ユーザー名をクリックすると、一対一でのやりとりができるチャットルームを作成できる。

### ②メッセージ機能
チャットルームでのやりとりをするために、メッセージ機能を実装する。

### ③通知機能
チャットルームでのやりとりを行っているユーザーから、メッセージが届いた事を確認できるように通知機能を実装する。  



# DB設計
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
| name                    | string    |                                              |

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

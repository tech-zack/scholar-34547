# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## users テーブル

| Column             | Type   | Options                 |
| ------------------ | ------ | ----------------------- |
| email              | string |  NOT NULL unique :true  |
| encrypted_password | string |  NOT NULL               |
| nickname           | string |  NOT NULL               |

### Association

- has_many :comments
- has_many :scholars

## comments テーブル

| Column     | Type        | Options           |
| ---------- | ----------- | ----------------- |
| text       | text        |  NOT NULL         |
| user       | references  | foreigen_key:true |
| scholar    | references  | foreigen_key:true |

### Association

- has_many :scholars
- belongs_to :user

## scholars テーブル

| Column   | Type          | Options             |
| -------- | ------------- | ------------------- |
| title    | string        |  NOT NULL           |
| text     | text          |  NOT NULL           |
| image    | ActiveStorage | foreigen_key:true   |
| user     | references    | foreigen_key:true   |

### Association

- belongs_to :user
- belongs_to :comment
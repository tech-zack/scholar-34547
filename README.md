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

## scholar

## アプリケーション概要
私たちの持っている知識や知恵を投稿し共有し合うことにより、「勉強」という考え方をなくすことを目的としたアプリケーションです。

「勉強とは」
もともと勉めて強いるという気の進まないことを我慢して、努力するという意味でした。現在は学習という言葉と同じ意味で使われてしまっています。
しかし、本来学問を学ぶという行為は楽しいものです。勉強のように辛いものを我慢するという考え方は、ここで一度考え直さなくてはなりません。

このアプリケーションの目的は以下の2点になります。

1 勉強という考え方を変える

今、私たちの周りにあるものは、何気ない知識や知恵から生まれてきました。
例えば、皆様にも馴染みのある日本のMSシュレッダーは「製麺機」をヒントに開発されました。
一見、雑学に思え、役に立たないと思っていることでも実は、社会を変える力があるのです。

2 学んだ学問を仕事、生活に生かす
scholarに投稿することや、投稿された記事を読むことで、勉強ではなく、本来の学問を学ぶことができます。
学んだことを仕事、生活に生かすことで、個人ではなく、社会によりよく貢献することが期待できるでしょう。

## 使用言語
・Ruby
・Ruby on Rails
・jQuery
・HTML/CSS
・SQL
・AWS（予定）

## デプロイ後のURL
http://scholar-34547.herokuapp.com

## テスト用のアカウント
・Basic認証 ID admin Pass 2222
・name:sample
・email:sample@example
・password:111111

## DEMO
## トップ画面
https://i.gyazo.com/774ceb7dcf7d077cca487ef102330c3a.jpg

## ユーザー新規登録画面
https://i.gyazo.com/a0c80c32ceb196ef2fa7f4df8084a276.jpg

## ログイン画面
https://i.gyazo.com/9e188539df59b01e887a20e8629133f8.jpg

## 新規投稿画面
https://i.gyazo.com/f24f3fa9986d991d0f4471406dbac432.jpg

## 投稿画面
https://i.gyazo.com/c023544c5025de228fe4eac05f4851ca.jpg

## コメント機能
https://i.gyazo.com/686bc93be2b38d278adcd34b0442d05d.jpg

## 利用方法
1.アクセスするとトップページに遷移 
2.「sign-in」をクリック  
3.ログインページに遷移した上で、上記テスト用アカウントでログイン
４.投稿されているコンテンツのimage画をクリックすると該当の詳細画面へ遷移
ログイン中であればいいね機能を使用すること、投稿についてコメントを送ることが可能
５.トップページにあるPOSTボタンを押すと新規投稿画面に遷移
それぞれ指定した要素を入力すると、What's newのところに遷移して追加される。また、mypageのPOSTボタンからも同じように投稿することが可能
6.各ページにある左上にある検索フォームにてカテゴリーを検索することが可能
７.「sign-up」をクリックすることでログアウト機能が発言

なお、ログインしなくても、検索機能を使用すること、投稿の詳細画面をみることは可能
いいね機能並びにコメントを送ることは不可

## 目指した課題解決
このアプリケーションを利用することで、老若男女問わず、学問を学ぶ楽しさを学ぶことができ、知ったものをもとに社会によりよく貢献できるようになる。

## 洗い出した要件
・勉強という考え方を変えたい
・みんなが持っている知識や知恵を社会に生かしたい

## 洗い出した要件

## users テーブル

| Column             | Type   | Options                 |
| ------------------ | ------ | ----------------------- |
| email              | string |  NOT NULL unique :true  |
| encrypted_password | string |  NOT NULL               |
| nickname           | string |  NOT NULL               |

### Association

- has_many :messages
- has_many :scholars
- has_many :likes

## messages テーブル

| Column        | Type     | Options           |
| ------------- | -------- | ----------------- |
| text          | text     |  NOT NULL         |
| user_id       | integer  | foreigen_key:true |
| scholar_id    | integer  | foreigen_key:true |

### Association

- belongs_to :scholar
- belongs_to :user

## scholars テーブル

| Column      | Type          | Options             |
| ----------- | ------------- | ------------------- |
| title       | string        |  NOT NULL           |
| text        | text          |  NOT NULL           |
| image       | ActiveStorage | foreigen_key:true   |
| user        | references    | foreigen_key:true   |
| category_id | interger      |  NOT NULL           |

### Association

- belongs_to :user
- has_many :massages
- belongs_to :category
- has_many :likes
- has_one_attached :image
  
  ## likes テーブル

| Column      | Type          | Options             |
| ----------- | ------------- | ------------------- |
| user_id     | integer       |  NOT NULL           |
| scholar_id  | interger      |  NOT NULL           |


### Association

- belongs_to :user
- belongs_to :scholar

https://i.gyazo.com/cd92fc69166601a46e32ab6dac707c92.png

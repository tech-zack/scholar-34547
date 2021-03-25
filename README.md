# README

## scholar

## アプリケーション概要
私たちの持っている知識や知恵を投稿し共有し合うことにより、「勉強」という考え方をなくすことを目的としたアプリケーションです。

「勉強とは」
もともと勉めて強いるという気の進まないことを我慢して、努力するという意味でした。現在は学習という言葉と同じ意味で使われてしまっています。

このアプリケーションの目的は以下の2点になります。

1 勉強という考えを変える

今、私たちの周りにあるものは、何気ない知識や知恵から生まれてきました。
例えば、皆様にも馴染みのある日本のMSシュレッダーは「製麺機」をヒントに開発されました。
一見、雑学に思えるようなことでも、社会を変える力があります。

2 学んだ学問を仕事、生活に生かす

scholarに投稿することや、投稿された記事を読むことで、学問を学ぶことができます。
学んだことを仕事、生活に生かすことで、個人ではなく、社会によりよく貢献することが期待できます。

## 使用言語
・Ruby2.6.5
・Ruby on Rails6.0.0
・jQuery
・HTML/CSS
・SQL0.4.4
・AWS（S3）

## デプロイ後のURL
 https://scholar-34547.herokuapp.com/

## テスト用のアカウント
・Basic認証 ID admin Pass 2222

・name:sample
・email:sample@example
・password:111111

## DEMO
## トップ画面
![image](https://user-images.githubusercontent.com/78070415/112457019-ace57480-8d9e-11eb-9009-9148c32663d6.png)

## ユーザー新規登録画面
![image](https://user-images.githubusercontent.com/78070415/112457442-1feeeb00-8d9f-11eb-88d1-468303f51a0a.png)

## ログイン画面
![image](https://user-images.githubusercontent.com/78070415/112457275-efa74c80-8d9e-11eb-9a07-b8b27da86dac.png)

## 新規投稿画面
![image](https://user-images.githubusercontent.com/78070415/112106186-b630de80-8bf0-11eb-9192-0fc11748dc77.png)

## 投稿画面詳細
![image](https://user-images.githubusercontent.com/78070415/112106560-2fc8cc80-8bf1-11eb-9218-a03b5a3a0232.png)

## コメント機能
![image](https://user-images.githubusercontent.com/78070415/112110201-eb8bfb00-8bf5-11eb-9f03-2591738a5554.png)

## 利用方法
1.アクセスするとトップページに遷移 

2.「sign-in」をクリック  

3.ログインページに遷移した上で、上記テスト用アカウントでログイン

４.投稿されているコンテンツのimage画をクリックすると該当の詳細画面へ遷移
ログイン中であればいいね機能を使用すること、投稿についてコメントを送ることが可能

５.トップページまたはマイページにあるPOSTボタンを押すと新規投稿画面に遷移
それぞれ指定した要素を入力すると、What's newのところに遷移して追加される。

6.各ページにある左上にある検索フォームにてカテゴリーを検索することが可能

７.「log out」をクリックすることでログアウト機能が発言

なお、ログインしなくても、検索機能を使用すること、投稿の詳細画面をみることは可能
いいね機能並びにコメントを送ることは不可

## 目指した課題解決
このアプリケーションを利用することで、老若男女問わず、学問を楽しむことができ、知ったものをもとに社会によりよく貢献することができるようになる。

## 洗い出した要件
・勉強という考え方を変えたい
・みんなが持っている知識や知恵を社会に生かしたい

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
- has_many :liked_scholars, through: :likes, source: :scholar

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
| user_id     | references    | foreigen_key:true   |
| category_id | interger      |  NOT NULL           |

### Association

- belongs_to :user
- has_many :massages
- belongs_to :category
- has_many :likes
- has_many :liked_users, through: :likes, source: :user
- has_one_attached :image
  
  ## likes テーブル

| Column      | Type          | Options             |
| ----------- | ------------- | ------------------- |
| user_id     | integer       |  NOT NULL           |
| scholar_id  | interger      |  NOT NULL           |


### Association

- belongs_to :user
- belongs_to :scholar

![image](https://user-images.githubusercontent.com/78070415/112110468-458cc080-8bf6-11eb-8b57-2737e2fe7901.png)

### ローカルでの動作方法
git clone https://github.com/tech-zack/scholar-34547.git

cd scholar-34547

$ bundle install 

$ rails db:create 

$ rails db:migrate 

$ rails s 

 http://localhost:3000
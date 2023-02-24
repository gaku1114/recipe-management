# アプリケーション名

Cook Note（クックノート）

<br />
<br />

# アプリケーション概要

レシピ管理アプリ。様々なレシピサイトのレシピの中から、気になったレシピを一箇所にまとめておくことができる。

<br />
<br />

# URL

<br />
<br />


# テスト用アカウント
- Basic認証パスワード：2222
- Basic認証ID：admin
- メールアドレス：test@com
- パスワード：123456  

<br />
<br />

# 利用方法

### レシピ登録

1. トップページのヘッダーからユーザー新規登録を行う  
2. ヘッダーのレシピ新規登録ボタンから、新規登録ページに遷移する  
3. 料理名、外部サイトのURL（任意）、ジャンル（任意）を入力して保存ボタンを押す
4. 一覧ページに遷移し、登録したレシピが保存されていることが確認できる

<br />

### 材料登録

1. レシピ一覧画面で料理名をクリックすると、レシピ詳細が表示される  
2. 材料追加ボタンをクリックすると、材料追加フォームが表示される  
3. 材料名を入力して追加ボタンを押す
4. 追加した材料が表示される

<br />

### 検索（ヘッダーから）

1. ヘッダーの「料理名で検索する」もしくは「材料名で検索する」ボタンをクリックすると、検索フォームが表示される  
2. 料理名もしくは材料名を入力して検索すると、自身が登録したレシピから検索にヒットしたレシピが一覧で表示される  

### 検索（レシピ詳細から）

1. レシピ一覧画面で料理名をクリックすると、レシピ詳細が表示される
2. レシピ詳細の材料名をクリックすると、材料名での検索が行われる
3. 自身が登録したレシピから、材料名にヒットしたレシピが一覧で表示される

<br />
<br />

# アプリケーションを作成した背景

課題をヒアリングしたところ、「レシピサイトの数が多く、気になったレシピや一度作ったレシピの管理が難しい」という課題を抱えていることが判明した。  
この課題を解決するために、クックパッドやクラシル、YouTubeなどのレシピを、一つにまとめておくことができる、自分だけのレシピ管理アプリケーションを這発することにした。

<br />
<br />

# 洗い出した要件

[要件定義シート](https://docs.google.com/spreadsheets/d/1WEjg-1hAYh5G1MOyV269G1_-04HixccSOAoLfY8aNks/edit#gid=982722306)

<br />
<br />

# 実装した機能についての画像やGIFおよびその説明

<br />
<br />

# 実装予定の機能

- 料理ごとに作った日を記録しておくことができる機能
- 「簡単さ」「作りやすさ」などを５段階で評価できる機能

<br />
<br />

# データベース設計

### usersテーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |

- has_many :dishes
- has_many :genres


### dishesテーブル

| Column      | Type       | Options                         |
| ----------- | ---------- | ------------------------------- |
| dish_name   | string     | null: false                     |
| url         | string     |                                 |
| user        | references | null: false,  foreign_key: true |
| genre       | references | foreign_key: true               |

- belongs_to :user
- belongs_to :genre
- has_many :materials
- has_many :dates, through: :dish_dates


### genresテーブル

| Column   | Type       |                                |
| -------- | ---------- | ------------------------------ |
| name     | string     | null: false                    |
| user     | references | null: false, foreign_key: true |

- has_many :dishes
- belongs_to :user



### materialsテーブル（材料）

| Column   | Type       |                                |
| -------- | ---------- | ------------------------------ |
| name     | string     | null: false                    |
| dish     | references | null: false, foreign_key: true |

- belongs_to :dish


### datesテーブル（作った日）

| Column   | Type       |                                |
| -------- | ---------- | ------------------------------ |
| ate_date | date       | null: false                    |

- has_many :dishes, through: :dish_dates

### dish_datesテーブル（中間テーブル）

| Column   | Type       |                                |
| -------- | ---------- | ------------------------------ |
| dish     | references | null: false, foreign_key: true |
| date     | references | null: false, foreign_key: true |

- belongs_to :dish
- belongs_to :date

<br />
<br />


# 画面遷移図

<br />
<br />

# 開発環境

- Ruby
- Ruby on Rails
- My SQL
- Github
- Render
- Visual Studio Code


<br />
<br />

# ローカルでの動作方法

以下のコマンドを順に実行  
% git clone https://github.com/gaku1114/recipi-management.git  
% cd xxxxx  
% bundle install  
% yarn install

<br />
<br />

# 工夫したポイント







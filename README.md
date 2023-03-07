# アプリケーション名

Cook Note（クックノート）

<br />

# アプリケーション概要

レシピ管理アプリ。  
自分だけのレシピ集を作ることを目的としたアプリ（レシピ投稿機能なし）。レシピサイトのレシピや、YouTubeのレシピ動画などを一箇所にまとめて保存しておくことができる。  
レシピ名や材料名での検索が可能。
また、レシピごとに作った日を記録しておくことができる。

<br />

# URL

https://recipe-management.onrender.com
<br />
<br />


# テスト用アカウント
- Basic認証パスワード：2222
- Basic認証ID：admin
- メールアドレス：test@com
- パスワード：123456  

<br />

# 利用方法

### レシピ登録

1. ユーザー新規登録を行う  
2. ヘッダーのレシピ新規保存ボタンから、新規保存ページに遷移する  
3. 料理名、外部サイトのURL（任意）、ジャンル（任意）、写真（任意）を入力して「保存する」ボタンを押す
4. 一覧ページに登録したレシピが保存されていることが確認できる。またジャンルを指定している場合、サイドバーのジャンル名をクリックすると、ジャンルごとのレシピ一覧を表示させることができる。

<br />

### 材料登録

1. レシピ一覧画面（もしくはジャンルごとのレシピ一覧画面）で料理名をクリックするとレシピ詳細が表示される  
2. 材料追加ボタンをクリックすると、材料追加フォームが表示される  
3. 材料名を入力して「追加」ボタンを押す
4. 追加した材料が表示される

<br />

### 検索（ヘッダーから）

1. ヘッダーの「料理名で検索する」もしくは「材料名で検索する」ボタンをクリックすると、検索フォームが表示される  
2. 料理名もしくは材料名を入力して検索すると、自身が登録しているレシピから検索にヒットしたレシピが一覧で表示される  

<br />

### 検索（レシピ詳細から）

1. レシピ一覧画面（もしくはジャンルごとのレシピ一覧画面）で料理名をクリックするとレシピ詳細が表示される 
2. レシピ詳細の材料名をクリックすると、材料名での検索が行われる
3. 自身が登録しているレシピから、材料名にヒットしたレシピが一覧で表示される

<br />

### 作った日を記録する

1. レシピ詳細の料理名をクリックすると、レシピごとの個別ページに遷移する
2. 「作ったボタン」をクリックすると、新規登録ページに遷移する
3. 日付を指定して「追加」ボタンをクリックする
4. レシピ個別ページに、「作った回数」「最後に作った日付」「作った日付一覧」が表示される

<br />
<br />

# アプリケーションを作成した背景

レシピサイトの数が増えたことで、「保存したレシピの管理が難しい」という課題があることが判明した。  
この課題を解決するために、クックパッドやクラシル、YouTubeなどのレシピを、一箇所にまとめて保存しておくことができるアプリケーションを開発することにした。

<br />
<br />

# 洗い出した要件

[要件定義シート](https://docs.google.com/spreadsheets/d/1WEjg-1hAYh5G1MOyV269G1_-04HixccSOAoLfY8aNks/edit#gid=982722306)

<br />

# 実装した機能についての画像およびその説明

<br />

- トップページ（レシピ一覧ページ）

<img src="https://user-images.githubusercontent.com/122003014/223469837-c951efc7-c0ad-4ebb-b5e2-aa9bdfcac079.png" width="500px">

<br />

- レシピ詳細ページ

<img src="https://user-images.githubusercontent.com/122003014/223470150-bd46168a-223b-43ca-a45d-a06f34f174a5.png" width="500px">

<br />

- レシピ詳細ページ（作った日を記録）

<img src="https://user-images.githubusercontent.com/122003014/223470282-df2bc2ea-67e1-4fc6-ab9c-a86c3dc2bcb2.png" width="500px">

<br />
<br />

# 実装予定の機能

- 長期間作っていない料理を通知でお知らせしてくれる機能
- よく使っている食材をグラフで確認できる機能
- 「おいしさ」「作りやすさ」などを５段階で評価できる機能
- アルバム機能

<br />
<br />

# データベース設計

<br />
<br />

<!-- ### usersテーブル

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
- has_many :cooks


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


### cooksテーブル（作った日）

| Column   | Type       |                                |
| -------- | ---------- | ------------------------------ |
| date     | date       | null: false                    |
| dish     | references | null: false, foreign_key: true |

- belongs_to :dish  -->

![picture 3](https://user-images.githubusercontent.com/122003014/223370944-fdcf78a0-d1a6-4f02-b24f-6336c2f097a6.png)  


<br />
<br />


# 画面遷移図  

<br />
<br />

![picture 4](images/de93d6c9e586840e24be0d8bf377d6f9e6e4f8387bd8d91da647e41338dbae1d.png)  


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

# ローカルでの動作確認方法

以下のコマンドを順に実行  
% git clone https://github.com/gaku1114/recipi-management.git  
% cd xxxxx  
% bundle install  
% yarn install

<br />
<br />

# 工夫したポイント

- レシピや材料はもちろん、ジャンルについてもそれぞれのユーザーで自由に設定できるようにすることで、カスタマイズ要素を強めた。  
- 材料追加機能や材料削除機能などを同ページで行えるようにして、ページ遷移を少なくすることで、ユーザビリティを向上させた。  
- シンプルで統一感のあるデザインにすることで、操作性を高めた。









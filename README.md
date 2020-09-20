<!-- # README

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

* ... -->
# 概要
  飲食店のテイクアウト管理デモ・アプリケーションです。
  買い物かご機能による商品の同時注文・注文（予約）情報管理・事前クレジット決済・顧客の管理の機能を担います。
  今回は小規模のテイクアウト専門店を想定していますが、チェーン店や宅配サービス併用など事業モデルに合わせてカスタマイズできるように拡張するつもりです。
<br>
<br>

# 作成の目的・動機
- 前職の大手レストランチェーンの現場で最も大変だったのが、テイクアウトに関するオペレーションでした。テイクアウトを管理するデジタルデバイスやシステムが無く、全て従業員による電話対応と手書きのアナログ管理に任されていました。当然ながらコロナ禍の人員削減下では深刻な現場の混乱を招き、急激なテイクアウト需要に対応しきれず多大な機会損失を経験しました。

- 中小規模の飲食店ではさらに大きな打撃を被り、コロナ禍での倒産事業も飲食業がトップです。慢性的な人員不足に悩む飲食業において、今後アナログからデジタルへのDXは必須条件です。しかし多くの飲食企業においてエンジニア人材は極めて少ないのが現状で、自社開発は難しい状況が今後も続きます。よって誰にでもすぐに運用できるシンプルなシステムや、プラットフォームの需要が今後も増していくでしょう。

- 家賃支払いも多くのテナント型小売業で倒産の要因となっており、自治体にとってもコロナ禍の補助金制度が深刻な歳出要因となっています。昨今では飲食なら中食ビジネスモデルへ、小売ならECサイトによる無店舗型モデルへの移行が進んでいます。このことからBtoC事業で今最も求められるツールの1つがテイクアウトに関するツールだと考え、ユーザーと運営者双方に社会貢献したい想いから本アプリケーションを開発しました。
<br>
<br>

# 接続

## ①接続にあたって
- AWSにより画像は恒久的に保存されます。一般的な著作権の範囲内でお試しください。
- 現状は管理者権限に階層を持たせていません。以下の管理者ユーザーで、商品管理機能をお試しください。
- Basic認証は用いていません。管理者ログインも一般ユーザーと同じくログイン画面からサインインしてください。
- 商品の出品・編集・削除は、管理者のみ行えます。
- ユーザーの購入機能は任意で新規登録していただくか、下記サンプルユーザーでお試しください。

## ②トップページURL
https://takeout28756.herokuapp.com/

## ③テスト用アカウント情報
- 管理者用  
  名前：管理者  
  メールアドレス名: admin@example.jp  
  パスワード: 1234zxcv
- 一般ユーザー（購入者）用  
  名前：山田太郎  
  メールアドレス: yamda.tarou@gmail.com  
  パスワード: 1qazxsw2  
- 購入用カード情報
  番号：4242424242424242
  期限：Tue Mar 24 2020 00:00:00 GMT+0900 (日本標準時)
  セキュリティコード：123

## ④Githubリポジトリ
https://github.com/k2pajero/takeout_app


## ⑤動作確認方法
- WebブラウザGoogle Chromeの最新版を利用してアクセスしてください。
ただしデプロイ等で接続できないタイミングもございます。その際は少し時間をおいてから接続してください。
- 接続先およびログイン情報については、上記の通りです。
- 同時に複数の方がログインしている場合に、ログインできない可能性があります。
- テスト管理者アカウントでログイン→トップページから出品ボタン押下→商品情報入力→商品出品
- 確認後、ログアウト処理をお願いします。


<br>
<br>

# 言語・デプロイ・開発環境
- Ruby On Rails 6.0.0
- Ruby 2.6.5
- JQuery
- mysql2
- Github
- AWS
- Visual Studio Code
- heroku
- STRIPE

<br>
<br>

# データベース

## テーブル設計
https://gyazo.com/44b4b23404716376a6e627ff5da6d21e

## users テーブル

| Column              | Type      | Options         |
| ------------------- | --------- | --------------- |
| nickname            | string    | null: false     |
| email               | string    | null: false     |
| password            | string    | null: false     |
| real_family_name    | string    | null: false     |
| real_first_name     | string    | null: false     |
| reading_family_name | string    | null: false     |
| reading_first_name  | string    | null: false     |
| birthday            | date      | null: false     |
| admin               | boolean   | default: false |

### Association

- has_one :address
- has_one :basket, dependent: :destroy
- has_one :purchase_record, dependent: :destroy

## items テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| name              | string     | null: false                    |
| description       | text       | null: false                    |
| genre_category_id | integer    | null: false                    |
| size_category_id  | integer    | null: false                    |
| speed_id          | integer    | null: false                    |
| price             | integer    | null: false                    |

### Association

- belongs_to_active_hash :size_category
- belongs_to_active_hash :genre_category
- belongs_to_active_hash :speed
- has_one_attached :image
- has_many :basket_items, dependent: :destroy
- has_many :purchase_record_items, dependent: :destroy

## comments テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |
| comment      | text       |                                |

### Association

- belongs_to :item
- belongs_to :user

## baskets テーブル

| Column       | Type       | Options                                      |
| ------------ | ---------- | -------------------------------------------- |
| user         | references | unique: true, null: false, foreign_key: true |

### Association

- has_many :basket_items, dependent: :destroy
- has_many :items, through: :basket_items

## basket_items テーブル

| Column       | Type       | Options                                     |
| ------------ | ---------- | ------------------------------------------- |
| basket       | references | index: true, null: false, foreign_key: true |
| item         | references | index: true, null: false, foreign_key: true |

### Association

- belongs_to :basket
- belongs_to :item

## purchase_records テーブル

| Column | Type       | Options                                                   |
| -------| ---------- | --------------------------------------------------------- |
| user   | references | index: true, unique: true, null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :purchase_record_items, dependent: :destroy
- has_many :items, through: :purchase_record_items

## purchase_record_items テーブル

| Column           | Type       | Options                                     |
| ---------------- | ---------- | ------------------------------------------- |
| purchase_records | references | index: true, null: false, foreign_key: true |
| item             | references | index: true, null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :purchase_record

## addresses テーブル
 
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          |            | null: false, foreign_key: true | 
| postal_code   | string     | null: false, default: ''       |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false, default: ''       |
| address       | string     | null: false, default: ''       |
| building_name | string     | default: ''                    |
| tell          | string     | null: false, default: ''       |

### Association

- belongs_to_active_hash :prefecture
- belongs_to :user, optional: true



# 仕様・使い方
注）キャプチャ画像は開発途中のもののため、本番環境でのレイアウトが異なります。

## ①トップ画面
- ヘッダーとフッターにアプリロゴが表示されています。クリックするとトップページに戻ります。
- 商品一覧画面を兼ねています
- 商品の出品・編集・削除を行うには、上記管理者情報でログインしてから行います。編集は商品詳細画面にリンクがあります。
<br>

<div><img src="https://gyazo.com/de8eec8d0cd4ba26ebbebfc8a715f9d0.gif" width="220px" align="left"><br>管理者としてログインした時のみ、管理者ダッシュボードページと商品出品ページへのリンクが現れます<br clear="all"></div>
 <br>
 <br>

<div><img src="https://gyazo.com/e374ec5bf82b5c450790cbb151c40187.gif" width="220px" align="left"><br>買い物かごのロゴを押すと、直接買い物かご一覧ページに遷移できる<br clear="all"></div>
 <br>
 <br>

## ②商品一覧
出品した商品が、出品された順（昇順）に表示されます。root画面はここに設定しています。

<div><img src="https://gyazo.com/c2de4bcedf27e14b0e5e41ba3b9b573f.gif" width="220px" align="left"><br>商品詳細画面には、商品の写真をクリックすると自動的に遷移します。<br clear="all"></div>
 <br>
 <br>

## ③管理者ダッシュボード画面

この画面からトップへのリンクと、ログアウトも出来ます。

<div><img src="https://gyazo.com/8728829c792d23f7da0bdb34a00c7a2f.gif" width="220px" align="left"><br>テーブル内のレコードを閲覧できます。<br clear="all"></div>
 <br>
 <br>

## ④商品出品
管理者としてログイン後、商品出品ページから出品します。  
入力に不備がある場合は、出品画面にリダイレクトされます。

<div><img src="https://gyazo.com/d9f738d953ebb40c1b5e9b9c904a1216.gif" width="220px" align="left"><br>画像・商品名・説明・各カテゴリー情報・価格を入力し「出品する」ボタンを押すと、自動的にトップページに遷移します。<br clear="all"></div>
 <br>
 <br>

## ⑤商品詳細
ログインしていないユーザー、ログインしている一般ユーザー、管理者のいずれも閲覧できます。
ログインしていない場合は、編集・削除・買い物かごに入れる、いずれのボタンもリンクを踏むことが出来ません。

<div><img src="https://gyazo.com/350fabf0781bf5be7224ab6b1172d91a.gif" width="220px" align="left"><br>管理者としてログインした時のみ、商品詳細画面に「編集」と「削除」のボタンが現れます。編集の場合は編集用画面に遷移します。<br clear="all"></div>
 <br>
 <br>

<div><img src="https://gyazo.com/05d9cfffcc16e749b4e4d32fffdad2b8.gif" width="220px" align="left"><br>一般ユーザーとしてログインした時のみ、商品詳細画面に「買い物かごに入れる」のボタンが現れます<br clear="all"></div>
 <br>
 <br>

## ⑥商品編集
管理者のみ編集画面に遷移できます。

<div><img src="https://gyazo.com/fae95b496f05ea353b610bb3e133d23d.gif" width="220px" align="left"><br> 「編集」ボタンをクリックすると、自動的にトップページに遷移します。商品出品時とほぼ同じUIで編集できます。前回の入力内容はフォームに維持されています。「変更する」ボタンを押すとupdateされ、トップページに遷移します。<br clear="all"></div>
 <br>
 <br>

## ⑥商品削除
管理者のみ商品削除画面の「削除」ボタンをクリックすると削除できます。

<div><img src="https://gyazo.com/9a6b9d52382ce9186b65f304d993df17.gif" width="220px" align="left"><br>「削除」ボタンをクリックすると、自動的にトップページに遷移します。<br clear="all"></div>
 <br>
 <br>

## ⑦買い物かご（カート）機能
ログインした一般ユーザーのみ使用できます。
買い物かご内の商品が一覧表示され、合計金額も自動計算されて表示されます。
「買い物に戻る」をクリックすると、自動的にトップページに遷移します。

<div><img src="https://gyazo.com/05d9cfffcc16e749b4e4d32fffdad2b8.gif" width="220px" align="left"><br>商品詳細画面の**買い物かごに入れる**ボタンをクリックすると、買い物かごに商品が追加され、買い物かご一覧画面に自動的に遷移します。<br clear="all"></div>
 <br>
 <br>

## ⑧事前決済による購入機能
ログインした一般ユーザーのみ使用できます。

<div><img src="https://gyazo.com/08a02e18b42b39539304c71325dd8e67.gif" width="220px" align="left"><br>買い物かご一覧画面の「購入する」ボタンをクリックすると、STRIPEのカード情報入力フォームが表示されます。<br clear="all"></div>
 <br>
 <br>

<div><img src="https://i.gyazo.com/bbdba5996ba5b6d8e1b0d26f555b61fd.gif" width="220px" align="left"><br>フォームにテストカードの情報を入力し、支払いボタンを押すと自動的に決済され、商品一覧画面に戻ります。このとき買い物かご内の商品はすべて空の状態に戻ります。<br clear="all"></div>
 <br>
 <br>

# 今後の拡張予定
- 商品の検索機能
- 店舗の地図表示機能
- 店舗のお知らせ表示（掲示板式）機能
- 買い物かごの商品の数量変更（削除）機能
- 商品のタグ付け機能
- 商品のコメント機能
- 売上表示機能
- クレジットカードの登録機能


# README
#  アプリケーション名
Tabiii
#  アプリケーションの概要
旅行をした人が、旅行の日記として画像や旅行先の情報を投稿していただき、投稿を見た方とのコミュニケーションを積極的に取っていくSNSです。
#  URL
https://tabiii.herokuapp.com/
#  テスト用アカウント
email:  dousa@dousa  
password:11111a
#  利用方法
投稿者  
投稿ページから新規投稿を日記感覚で行う（おすすめのスポット等を記入)  
閲覧者  
投稿一覧ページより、ユーザーの投稿を見ることができるので自身の次の旅先候補を探したり、旅先に迷う場合は、直接コメント欄で質問等もでき、コミュニケーションを取ることができます。   
#  アプリケーションを作成した背景   
1.旅行をして多くの写真を撮るので、旅行先の素晴らしい写真と旅行で訪れた場所を日記のように保存しておき、見返したいと自ら感じました。   
2.兄が新婚旅行に沖縄の宮古島に行き、その写真をLINEでしてくれました。その写真を見ると自分も旅行に行きたいと感じました。   
3.コロナ禍で旅行を憚る方や旅行先を決めかねている方は、他の方が訪れた旅行先を決めるためにインスタグラム以上に旅行に特化したSNSがあれば、旅行についての情報を調べることができると考えました。   
上記の３つの理由から、このサービスを考え作成することにしました。   
#  洗い出した要件定義
要件定義スプレッドシート   
https://docs.google.com/spreadsheets/d/15fGuyuroHvQm7HLGdeNhtPyawGrZCWFVT823LFLiars/edit?usp=sharing
#  実装した機能についての画像やGIF動画  
1.ActionCableを用いたコメント非同期処理  
[![Image from Gyazo](https://i.gyazo.com/8c9268d59f9ba628f09c1039d3c23784.gif)](https://gyazo.com/8c9268d59f9ba628f09c1039d3c23784)  

2.GoogleMapAPIを利用した地図情報の埋め込み  
[![Image from Gyazo](https://i.gyazo.com/bc4a8396f0d4aa57339caec1cf1f26d3.gif)](https://gyazo.com/bc4a8396f0d4aa57339caec1cf1f26d3)  

3.JavaScriptを用いた、ページへの動的機能の実装  
・テキストの文字数カウント(自己紹介欄と投稿内容欄)  
[![Image from Gyazo](https://i.gyazo.com/33c7ddb2d324a4288978995df67844ee.gif)](https://gyazo.com/33c7ddb2d324a4288978995df67844ee)
・削除機能ボタンを押下後のポップアップ表示の実装  
[![Image from Gyazo](https://i.gyazo.com/5ba4a465e7511ec0ebe85ea907b4b13b.gif)](https://gyazo.com/5ba4a465e7511ec0ebe85ea907b4b13b)  
・画像プレビュー機能の実装  
[![Image from Gyazo](https://i.gyazo.com/a614d919cb67937b7b0ffe89e9d82180.gif)](https://gyazo.com/a614d919cb67937b7b0ffe89e9d82180)  

4.jQueryを用いた実装  
・stickyヘッダー  
[![Image from Gyazo](https://i.gyazo.com/f79fed82f679944c894778775e26325f.gif)](https://gyazo.com/f79fed82f679944c894778775e26325f)  
・slickを用いたスライドショー  
[![Image from Gyazo](https://i.gyazo.com/42c1a439fe1a12e35945794cceb8d48e.gif)](https://gyazo.com/42c1a439fe1a12e35945794cceb8d48e)

5.ActiveHashとransackを用いたカテゴリー別詳細ページの実装  
[![Image from Gyazo](https://i.gyazo.com/e82252b8404e7565a2249baaecf8604b.gif)](https://gyazo.com/e82252b8404e7565a2249baaecf8604b)

#  実装予定の機能
1.各都道府県ごとの投稿一覧ページに、現地が所在する県庁所在地の天気予報を表示  
【方法】  
・スクレイピングによって、気象庁もしくはウェザーニュース等のサイトから情報を取得する。  
・API機能を用いて天気情報を取得する。  

2.UI/UXを意識したフロント部分の改良  
バックエンドもしくはフロントエンドどちらを担当することとなっても、UI/UXの知識は必要になると考えているので、学習のためにも改良したいと考えています。  

3.お気に入り機能、フォロー機能への非同期処理を導入  
上記のUXを改善するために必須であり、JavaScriptへの知識を深めたいと考えているので非同期処理への理解を深めたいと思います。  

4.お気に入り登録した投稿とフォローしているユーザーの投稿をそれぞれ一覧表示にできるビュー作成  

5.単体テストコード追加  


#  データベース設計
[![Image from Gyazo](https://i.gyazo.com/70fe69ecbe2bca4ce2d9819943074ca2.png)](https://gyazo.com/70fe69ecbe2bca4ce2d9819943074ca2)

## Usersテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| nickname            | string     | null: false                    |
| email               | string     | null: false, unique: true      |
| encrypted_password  | string     | null: false                    |
| last_name           | string     | null: false                    |
| first_name          | string     | null: false                    |
| profile             | text       |                                |
| profile_image       | string     |                                |

### Association
- has_many :posts
- has_many :favorites
- has_many :comments
- has_many :follows

## Postsテーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| title        | string     | null: false                    |
| content      | text       | null: false                    |
| province_id  | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |
| address      | text       |                                |

### Association
- has_many :comments
- has_many :favorites
- belongs_to :user

## Commentsテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| chat       | text       | null: false                    |
| user       | references | null: false, foreign_key: true |
| post       | references | null: false, foreign_key: true |

### Association
- belongs_to :post
- belongs_to :user

## Favoritesテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| post        | references | null: false, foreign_key: true |

### Association
- belongs_to :post
- belongs_to :user


## Followsテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| follow      | references | null: false, foreign_key: true |
| user        | references | null: false, foreign_key: true |

### Association
- has_many :users


#  画面遷移図
[![Image from Gyazo](https://i.gyazo.com/1eac537e6fffb34f055bf33b123d25dd.png)](https://gyazo.com/1eac537e6fffb34f055bf33b123d25dd)
#  開発環境
・フロントエンド  
・バックエンド  
・インフラ  
・テスト  
・テキストエディタ  
・GitHubタスク管理  
#  使用言語・フレームワーク・ライブラリ
・Ruby  
・Ruby On Rails  
・HTML  
・CSS  
・JavaScript  
・jQuery  

#  単体テスト
1.Userテスト  
[![Image from Gyazo](https://i.gyazo.com/2b47241bdc60fb2515692c7dff9503f8.gif)](https://gyazo.com/2b47241bdc60fb2515692c7dff9503f8)  

2.Postテスト  
[![Image from Gyazo](https://i.gyazo.com/0a744811c5f51abcc678d9de53ea9e42.gif)](https://gyazo.com/0a744811c5f51abcc678d9de53ea9e42)

#  工夫したポイント
1.GoogleMapAPIを用いた、マップの埋め込み
外部サービスを連携させることで、日頃利用しているサービスに近づけて実装の基本を学ぶことを意識しました。実装する際に、外部キーの登録等は比較的容易にできましたが、外部キーを環境変数に変えてマップを表示することに苦戦しました。外部キーや環境変数に対する知識を深めるいい機会になりました。  
2.投稿一覧ページのビュー  
今までRuby,Railsメインの学習を進めていたので、フロント実装に関する知識も蓄えたいと考えていました。そこで、JavaScriptやjQueryを作成したフロントの実装をインプットするいい機会となりました。  
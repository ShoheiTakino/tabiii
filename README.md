# README
#  アプリケーション名
Tabiii
#  アプリケーションの概要
旅行をした人が、旅行の日記として画像や旅行先の情報を投稿していただき、投稿を見た方とのコミュニケーションを積極的に取っていくSNSです。
#  URL
https://tabiii.herokuapp.com/
#  *テスト用アカウント
email:  
password:
#  利用方法
投稿者  
投稿ページから新規投稿を日記感覚で行う（おすすめのスポット等を記入)  
閲覧者  
投稿一覧ページより、ユーザーの投稿を見ることができるので自身の次の旅先候補を探したり、旅先に迷う場合は、直接コメント欄で質問等もでき、コミュニケーションを取ることができる。   
#  アプリケーションを作成した背景   
1.旅行をして写真を多く撮るので、旅行先の素晴らしい写真と旅行で訪れた場所を日記のように保存しておき、見返したいと自ら感じました。   
2.兄が結婚旅行に沖縄の宮古島に行き、その写真をLINEで送ってきた。その写真を見ると自分も旅行に行きたいと感じました。   
3.コロナ禍で旅行を憚る方や旅行先を決めかねている方は、他の方が訪れた旅行先を決めるためにインスタグラム以上に旅行に特化したSNSがあれば、旅行についての情報を調べることができると考えました。   
上記の３つの理由から、このサービスを考え作成することにしました。   
#  洗い出した要件定義
要件定義スプレッドシート   
https://docs.google.com/spreadsheets/d/15fGuyuroHvQm7HLGdeNhtPyawGrZCWFVT823LFLiars/edit?usp=sharing
#  *実装した機能についての画像やGIF動画

#  実装予定の機能
・各都道府県ごとの投稿一覧ページに、現地が所在する県庁所在地の天気予報を表示する。  
【方法】  
1.スクレイピングによって、気象庁もしくはウェザーニュース等のサイトから情報を取得する。  
2.API機能を用いて天気情報を取得する。  
・UI/UXを意識したフロント部分の改良  
バックエンドもしくはフロントエンドどちらを担当することとなっても、UI/UXの知識は必要になると考えているので、学習のためにも改良したいと考えています。  
・お気に入り機能、フォロー機能への非同期処理を導入  
上記のUXを改善するために必須であり、JavaScriptへの知識を深めたいと考えているので非同期処理への理解を深めたいと思います。  

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
| follower    | references | null: false, foreign_key: true |
| followed    | references | null: false, foreign_key: true |

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
#  *ローカルで動作方法

#  *工夫したポイント
1.GoogleMapAPIを用いた、マップの埋め込み
外部サービスを連携させることで、日頃利用しているサービスに近づけて実装の基本を学ぶことを意識しました。実装する際に、外部キーの登録等は比較的容易にできましたが、外部キーを環境変数に変えてマップを表示することに苦戦しました。外部キーや環境変数に対する知識を深めるいい機会になりました。  
2.投稿一覧ページのビュー  
今までRuby,Railsメインの学習を進めていたので、フロント実装に関する知識も蓄えたいと考えていました。そこで、JavaScriptやjQueryを作成したフロントの実装をインプットするいい機会となりました。
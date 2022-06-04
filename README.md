# README
#  アプリケーション名
TabiJiii
#  アプリケーションの概要
旅行をした人が、旅行の日記として画像や旅行先の情報を投稿していただき、投稿を見た方とのコミュニケーションを積極的に取っていくSNSです。
#  *URL

#  *テスト用アカウント

#  利用方法
投稿者  
投稿ページから新規投稿を日記感覚で行う（おすすめのスポット等を記入)  
投稿閲覧者  
投稿一覧ページより、ユーザーの投稿を見ることができるので自身の次の旅先候補を探したりコロナ禍で旅行を憚るユーザーは投稿を見ることで、旅行した感覚になれる。
#  アプリケーションを作成した背景  
1.旅行をして写真を多く撮るので、旅行先の素晴らしい写真と旅行で訪れた場所を日記のように保存しておき、見返したいと自ら感じた。  
2.兄が結婚旅行に沖縄の宮古島に行き、その写真をLINEで送ってきた。その写真を見ると自分も旅行に行きたいと感じた。   
3.コロナ禍で旅行を憚る方や旅行先を決めかねている方は、他の方が訪れた旅行先を決めるためにインスタグラム以上に旅行に特化したSNSがあれば、旅行についての情報を調べることができると考えた。  
上記の３つの理由から、このサービスを考え作成することとなった。
#  洗い出した要件定義
要件定義スプレッドシート
https://docs.google.com/spreadsheets/d/1mN7qLIq4Z2e9uTgh_gjQW86uiYzVQig_Yw2UFoj8gek/edit?usp=sharing
#  *実装した機能についての画像やGIF動画

#  *実装予定の機能


#  データベース設計
[![Image from Gyazo](https://i.gyazo.com/7354980a86e59d6fbdbd080f0a7c661d.png)](https://gyazo.com/7354980a86e59d6fbdbd080f0a7c661d)

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

### Association
- has_many :comments
- has_many :favorits
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
[![Image from Gyazo](https://i.gyazo.com/1e7d8e3e973795a4c80abbd862fef81f.png)](https://gyazo.com/1e7d8e3e973795a4c80abbd862fef81f)
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

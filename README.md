# Petting Farm

## サービス概要
ペットの写真を自由に投稿するサイトです。
Petting Farm = "動物園のふれあいコーナー" という意味です。写真をたくさん投稿することによって、動物とのふれあいをより身近に感じられるようなサイトをみんなで作っていきましょう！

## 作る上で意識した事

## URL
https://pettingfarm.herokuapp.com/

＊ページ内には「簡単ログイン（テストユーザーとしてログインができる機能）」も実装してありますので、そちらをご利用いただけると幸いです。


## 開発環境
- Ruby 2.6.6
- Rails 6.1.3

## ER図
![top](./public/img/Petting_Farm_ER.png)

## 各種機能＆導入技術
- プラットフォーム (Heroku)
- データベース (MySQL, PostgleSQL)
- ログイン (device)
- コードチェック (rubocop)
- セキュリティチェック (brakeman)
- 画像アップロード (carrierwave、mini_magick)
- ページネーション (kaminari)
- いいね (Ajax)
- 検索 (ransack)
- カレンダー (simple_calendar)
- パンくずリスト (gretel)
- 管理者画面 (admin)
- SEO対策 (meta-tags、sitemap_generator)

## トップページ
![top](./public/img/Petting_Farm_top.png)

## マイページ
![top](./public/img/Petting_Farm_my.png)

## ペット管理ページ
![top](./public/img/Petting_Farm_pet.png)
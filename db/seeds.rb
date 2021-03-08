category1 = Post.create(name:"トップページ")

category1_1 = category1.children.create(name:"投稿一覧")
category1_2 = category1.children.create(name:"ペット一覧")
category1_3 = category1.children.create(name:"マイページ")
category1_4 = category1.children.create(name:"アプリ紹介")

category1_1.children.create([{name:"記事詳細"}])
category1_2.children.create([{name:"ペット詳細"}])
category1_3.children.create([{name:"My投稿"},{name:"Myペット"}])

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

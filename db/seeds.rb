# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



# users テーブルを再生成（関連付いたテーブルを含む）
ActiveRecord::Base.connection.execute("TRUNCATE TABLE users RESTART IDENTITY CASCADE")

user1 = User.create!(email: "satou@example.com", password: "password")
user2 = User.create!(email: "suzuki@example.com", password: "password")
user3 = User.create!(email: "tanaka@example.com", password: "password")

user2.posts.create!(content: "沖縄そば")
user1.posts.create!(content: "海ぶどう")
user3.posts.create!(content: "ゴーヤーチャンプルー")
user3.posts.create!(content: "サーターアンダギー")
user1.posts.create!(content: "タコライス")

# ログイン時に使用するアカウント（変数への代入は不要）
User.create!(email: email, password: password)

puts "初期データの投入に成功しました！"

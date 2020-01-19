# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#"1=北海道", 2="東北", 3="関東", 4="中部", 5="近畿", 6="中国", 7="四国", 8="九州"
Prefecture.create(name:"北海道", area:"1")

Prefecture.create(name:"青森県", area:"2")
Prefecture.create(name:"岩手県", area:"2")
Prefecture.create(name:"宮城県", area:"2")
Prefecture.create(name:"秋田県", area:"2")
Prefecture.create(name:"山形県", area:"2")
Prefecture.create(name:"福島県", area:"2")

Prefecture.create(name:"茨城県", area:"3")
Prefecture.create(name:"栃木県", area:"3")
Prefecture.create(name:"群馬県", area:"3")
Prefecture.create(name:"埼玉県", area:"3")
Prefecture.create(name:"千葉県", area:"3")
Prefecture.create(name:"東京都", area:"3")
Prefecture.create(name:"神奈川県", area:"3")

Prefecture.create(name:"新潟県", area:"4")
Prefecture.create(name:"富山県", area:"4")
Prefecture.create(name:"石川県", area:"4")
Prefecture.create(name:"福井県", area:"4")
Prefecture.create(name:"山梨県", area:"4")
Prefecture.create(name:"長野県", area:"4")
Prefecture.create(name:"岐阜県", area:"4")
Prefecture.create(name:"静岡県", area:"4")
Prefecture.create(name:"愛知県", area:"4")
Prefecture.create(name:"三重県", area:"4")

Prefecture.create(name:"滋賀県", area:"5")
Prefecture.create(name:"京都府", area:"5")
Prefecture.create(name:"大阪府", area:"5")
Prefecture.create(name:"兵庫県", area:"5")
Prefecture.create(name:"奈良県", area:"5")
Prefecture.create(name:"和歌山県", area:"5")

Prefecture.create(name:"鳥取県", area:"6")
Prefecture.create(name:"島根県", area:"6")
Prefecture.create(name:"岡山県", area:"6")
Prefecture.create(name:"広島県", area:"6")
Prefecture.create(name:"山口県", area:"6")

Prefecture.create(name:"徳島県", area:"7")
Prefecture.create(name:"香川県", area:"7")
Prefecture.create(name:"愛媛県", area:"7")
Prefecture.create(name:"高知県", area:"7")

Prefecture.create(name:"福岡県", area:"8")
Prefecture.create(name:"佐賀県", area:"8")
Prefecture.create(name:"長崎県", area:"8")
Prefecture.create(name:"熊本県", area:"8")
Prefecture.create(name:"大分県", area:"8")
Prefecture.create(name:"宮崎県", area:"8")
Prefecture.create(name:"鹿児島県", area:"8")
Prefecture.create(name:"沖縄県", area:"8")
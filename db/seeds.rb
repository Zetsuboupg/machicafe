# db/seeds.rb

# 既存のデータを削除
Cafe.destroy_all
Tag.destroy_all

# 画像ファイルのパスを定義
image_paths = {
  cafe_a: Rails.root.join('app/assets/images/cafe.png'),
  cafe_b: Rails.root.join('app/assets/images/cafe.png'),
  cafe_c: Rails.root.join('app/assets/images/cafe.png')
}

# カフェを作成（住所はすべて東京駅）
cafe_a = Cafe.create!(
  name: "カフェA",
  description: "素敵なカフェ",
  address: "東京都葛飾区",
  latitude: 35.681236,
  longitude: 139.767125,
  image: {
    io: File.open(image_paths[:cafe_a]),
    filename: 'cafe.png'
  }
)

cafe_b = Cafe.create!(
  name: "カフェB",
  description: "落ち着いた雰囲気のカフェ",
  address: "東京都港区",
  latitude: 35.681236,
  longitude: 139.767125,
  image: {
    io: File.open(image_paths[:cafe_b]),
    filename: 'cafe.png'
  }
)

cafe_c = Cafe.create!(
  name: "カフェC",
  description: "わくわくなカフェ",
  address: "東京都千代田区",
  latitude: 35.681236,
  longitude: 139.767125,
  image: {
    io: File.open(image_paths[:cafe_c]),
    filename: 'cafe.png'
  }
)

# タグを作成
Tag.create!([
  { name: '雰囲気がいい' },
  { name: 'しゃべりやすい' },
  { name: 'おしゃれ' },
  { name: '個室' },
  { name: 'にぎやか' },
  { name: '落ち着いてる' }
])

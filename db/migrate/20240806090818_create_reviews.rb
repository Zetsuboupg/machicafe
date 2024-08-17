class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :cafe_id
      t.integer :rating  # 1つの評価項目
      t.text :comment

      t.timestamps
    end
  end
end

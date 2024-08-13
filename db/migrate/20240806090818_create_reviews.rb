class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :cafe_id
      t.float :comfort_rating
      t.float :talk_rating
      t.float :ambiance_rating
      t.text :comment

      t.timestamps
    end
  end
end

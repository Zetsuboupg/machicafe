class DropTaggingsTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :taggings, if_exists: true
  end
end

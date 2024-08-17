class DropAdministratorsTable < ActiveRecord::Migration[6.0]
  def up
    drop_table :administrators
  end

  def down
    create_table :administrators do |t|
      # 以前のテーブル構造を定義します
      t.string :email
      t.string :password_digest
      t.timestamps
    end
  end
end

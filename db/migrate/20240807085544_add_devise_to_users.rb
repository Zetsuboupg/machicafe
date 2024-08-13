class AddDeviseToUsers < ActiveRecord::Migration[6.1]

  def change
    change_table :users do |t|
      ## Database authenticatable

      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## 名前を保存するカラム
      t.string :name

      add_index :users, :email,                unique: true
      add_index :users, :reset_password_token, unique: true
    end
  end
end
class AddAttributesToCafe < ActiveRecord::Migration[6.1]
  def change
    add_column :caves, :name, :string
    ## add_column :caves, :description, :text
    ## add_column :caves, :address, :string
    add_column :reviews, :content, :text
  end
end

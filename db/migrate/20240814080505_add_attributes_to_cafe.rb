class AddAttributesToCafe < ActiveRecord::Migration[6.1]
  def change
    add_column :cafes, :name, :string
    ## add_column :cafes, :description, :text
    ## add_column :cafes, :address, :string
    add_column :reviews, :content, :text
  end
end

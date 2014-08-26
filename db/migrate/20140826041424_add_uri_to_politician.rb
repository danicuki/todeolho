class AddUriToPolitician < ActiveRecord::Migration
  def change
    add_column :politicians, :uri, :string
    add_index :politicians, :uri
  end
end

class AddIndexToApiId < ActiveRecord::Migration
  def change
    add_index :politicians, :api_id
  end
end

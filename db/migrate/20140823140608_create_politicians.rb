class CreatePoliticians < ActiveRecord::Migration
  def change
    create_table :politicians do |t|
      t.string :api_id
      t.string :name

      t.timestamps
    end
  end
end

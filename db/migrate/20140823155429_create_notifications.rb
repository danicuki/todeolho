class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.references :politician, index: true
      t.string :category
      t.text :message

      t.timestamps
    end
  end
end

class AddMoreProfileColumnsToPoliticians < ActiveRecord::Migration
  def change
    add_column :politicians, :house, :string
    add_column :politicians, :state, :string
    add_column :politicians, :title, :string
    add_column :politicians, :past_jobs, :text
    add_column :politicians, :past_parties, :text
  end
end

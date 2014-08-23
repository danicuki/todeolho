class CreatePoliticiansUsers < ActiveRecord::Migration
  def change
    create_table :politicians_users do |t|
      t.references :user, index: true
      t.references :politician, index: true
    end
  end
end

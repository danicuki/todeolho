class AddProfileColumnsToPoliticians < ActiveRecord::Migration
  def change
    add_column :politicians, :image, :string
    add_column :politicians, :nickname, :string
    add_column :politicians, :party, :string
    add_column :politicians, :bio, :text
    add_column :politicians, :job_title, :string
    add_column :politicians, :candidate_number, :string
    add_column :politicians, :candidate_title, :string
    add_column :politicians, :age, :string
    add_column :politicians, :cpf, :string
    add_column :politicians, :scholarity, :string
  end
end

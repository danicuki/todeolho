class UpdateCollumJobTitleToPoliticians < ActiveRecord::Migration
  def change
    change_column :politicians, :job_title, :text
  end
end

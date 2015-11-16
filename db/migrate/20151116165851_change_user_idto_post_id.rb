class ChangeUserIdtoPostId < ActiveRecord::Migration
  def change
  	rename_column :comments, :user_id, :post_id
  end
end

class RemoveUserIdIdFromComments < ActiveRecord::Migration
  def change
    remove_column :comments, :user_id_id, :integer
  end
end

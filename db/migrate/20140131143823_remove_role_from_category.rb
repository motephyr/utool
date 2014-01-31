class RemoveRoleFromCategory < ActiveRecord::Migration
  def change
    remove_column :categories,:role
  end
end

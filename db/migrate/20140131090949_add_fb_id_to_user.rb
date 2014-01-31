class AddFbIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :fb_id, :string, :limit => 20
    add_column :users, :token, :string
    add_column :users, :name, :string
    add_column :users, :github_link,:string
    add_column :users, :blog_link,:string
    add_column :users, :summary,:text
  end
end

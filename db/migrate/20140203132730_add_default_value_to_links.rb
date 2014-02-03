class AddDefaultValueToLinks < ActiveRecord::Migration
  def up
    change_column :links, :hits, :integer, default: 0
    change_column :categories, :links_count, :integer, default: 0
  end

  def down
    change_column :links, :hits, :integer, default: nil
    change_column :categories, :links_count, :integer, default: nil
  end
end

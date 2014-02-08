class AddPositionToLink < ActiveRecord::Migration
  def change
    add_column :links, :position, :integer
  end
end

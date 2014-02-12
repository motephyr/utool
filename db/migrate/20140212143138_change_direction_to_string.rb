class ChangeDirectionToString < ActiveRecord::Migration
  def change
    change_column(:links,:direction,:string)
  end
end

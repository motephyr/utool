class AddIndex < ActiveRecord::Migration
  def change
    add_index(:categories,:name)
    add_index(:categories,:user_id)
    add_index(:links,:user_id)
    add_index(:links,:category_id)
  end
end

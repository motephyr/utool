class AddLinksCountToCategories < ActiveRecord::Migration
  def change
    add_column :categories,:links_count,:integer
  end
end

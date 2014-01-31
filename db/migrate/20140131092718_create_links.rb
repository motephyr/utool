class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :title
      t.string :url
      t.integer :user_id
      t.text :description
      t.string :thumbnail_url
      t.string :favicon_url
      t.string :provider_name
      t.string :provider_url
      t.string :link_type
      t.string :author_name
      t.string :author_url
      t.integer :thumbnail_width
      t.integer :thumbnail_height
      t.text :html
      t.integer :width
      t.integer :height
      t.integer :hits
      t.integer :category_id
      t.text :direction

      t.timestamps
    end
  end
end

class ChangeColumnInLink < ActiveRecord::Migration
  def change
    change_column(:links,:thumbnail_url,:text)
  end
end

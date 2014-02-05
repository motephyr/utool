class Category < ActiveRecord::Base

 belongs_to :user
 has_many :link

 validates :name, presence: true

 scope :order_by_id, -> { order("id ASC") }
end

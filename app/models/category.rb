class Category < ActiveRecord::Base

 belongs_to :user
 has_many :link

 validates :name, presence: true

end

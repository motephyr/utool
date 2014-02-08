class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  serialize :links

  has_many :links,-> { order("position ASC") }
  has_many :categories

  extend OmniauthCallbacks

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  def is_self?(user)
    user && user == self
  end
end

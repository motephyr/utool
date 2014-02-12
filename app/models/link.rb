class Link < ActiveRecord::Base
  include ActionView::Helpers::TextHelper
  
  belongs_to :author, :class_name => "User", :foreign_key => :user_id

  belongs_to :category, :counter_cache => true
  acts_as_list scope: :user_id

  validates :url, presence: true,uniqueness: { scope: :user_id}

  scope :recent, -> {order("created_at DESC")}
  scope :hot, -> {order("hits DESC")}

  after_create :update_info
 
  def update_info
    update_from_embedly
  end
 

  def update_from_embedly
 
    link = self
 
    urls = [url]
    embedly_api = Embedly::API.new(:key => Setting.embedly_key)
    embedly_objs = embedly_api.oembed(:urls => urls)
 
    response_data = embedly_objs[0].marshal_dump
 
    link.title             =  truncate(response_data[:title], length: 255)
    link.link_type         =  truncate(response_data[:type], length: 255)
    link.author_name       =  truncate(response_data[:author_name], length: 255)
    link.author_url        =  truncate(response_data[:author_url], length: 255)
    link.provider_name     =  truncate(response_data[:provider_name], length: 255)
    link.provider_url      =  truncate(response_data[:provider_url], length: 255)
    link.description       =  response_data[:description]
    link.thumbnail_url     =  truncate(response_data[:thumbnail_url], length: 255)
    link.thumbnail_width   =  response_data[:thumbnail_width]
    link.thumbnail_height  =  response_data[:thumbnail_height]
    link.html              =  response_data[:html]
    link.width             =  response_data[:width]
    link.height            =  response_data[:height]
 
    link.save
  end

  def editable_by?(user)
    user && user == author
  end
end

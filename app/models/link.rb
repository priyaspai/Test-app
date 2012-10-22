class Link < ActiveRecord::Base
  attr_accessible :url

  belongs_to :user

  validates :url, :presence => true, :uniqueness => {:scope => :user_id, :message => "Link is already saved"}

  scope :recent, order("created_at DESC")
end

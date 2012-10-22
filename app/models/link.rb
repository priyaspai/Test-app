class Link < ActiveRecord::Base
  attr_accessible :url

  belongs_to :user

  validates_presence_of :url
  validates_uniqueness_of :url, :scope => :user_id, :message => "Link is already saved"

  scope :recent, order("created_at DESC")
end

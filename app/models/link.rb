class Link < ActiveRecord::Base
  attr_accessible :url

  belongs_to :user

  validates_uniqueness_of :url, :scope => :user_id, :message => "Link is already saved"
end

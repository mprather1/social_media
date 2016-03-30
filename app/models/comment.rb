class Comment < ActiveRecord::Base

  belongs_to :page
  belongs_to :user
  delegate :first_name, to: :user, prefix: true
  delegate :last_name, to: :user, prefix: true
  delegate :avatar, to: :user, prefix: true
  validates :body, :presence => true, :length => { :minimum => 3 }
  mount_uploader :comment_image, CommentImageUploader
end

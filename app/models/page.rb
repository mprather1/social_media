class Page < ActiveRecord::Base
  
  belongs_to :user
  has_many :comments
  
  validates :title, :presence => true, :length => { :minimum => 5 }
  validates :content, :presence => true, :length => { :minimum => 5 }
  
  mount_uploader :submission_image, SubmissionImageUploader
  
  scope :sorted, lambda { order("pages.created_at DESC")}
  
  def sub_image
      submission_image
  end

      
end

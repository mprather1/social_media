class AddSubmissionImagesToComments < ActiveRecord::Migration
  def change
    add_column :comments, :comment_image, :string
  end
end

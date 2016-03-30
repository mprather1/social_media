class AddImageToSubmissions < ActiveRecord::Migration
  def change
    add_column :pages, :submission_image, :string
  end
end

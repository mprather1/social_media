class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.integer :user_id
      t.string :title
      t.string :author
      t.string :permalink
      t.text :content

      t.timestamps null: false
    end
    add_index('pages', 'user_id')
  end
end

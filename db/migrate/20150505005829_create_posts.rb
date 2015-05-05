class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :blog_name
      t.string :post_url
      t.string :type
      t.date :date
      t.string :tags
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :posts, :users
  end
end

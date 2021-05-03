class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :url, unique: true
      t.text :content
      t.integer :sub_id, index: true
      t.integer :author_id, index: true

      t.timestamps
    end
  end
end

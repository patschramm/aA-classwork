class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true, unique: false
      t.references :artwork, foreign_key: true, unique: false
      t.string :body, null: false
      t.timestamps
    end
  end
end

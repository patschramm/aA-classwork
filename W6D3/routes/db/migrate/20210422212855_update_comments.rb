class UpdateComments < ActiveRecord::Migration[5.2]
  def change
    change_column :comments, :user_id, :bigint, null: false
    change_column :comments, :artwork_id, :bigint, null: false
  end
end

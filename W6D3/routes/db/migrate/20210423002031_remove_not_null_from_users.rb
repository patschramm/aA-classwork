class RemoveNotNullFromUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :age, :integer, null: true
  end
end

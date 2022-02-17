class AddUserReferenceToUsersBests < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :users_bests, :users
    add_index :users_bests, :user_id
    change_column_null :users_bests, :user_id, false
  end
end

class AddDishesReferenceToUsersBests < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :users_bests, :dishes, column: :dishes_id
    add_index :users_bests, :dishes_id
    change_column_null :users_bests, :dishes_id, false
  end
end

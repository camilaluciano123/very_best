class CreateUsersBests < ActiveRecord::Migration[6.0]
  def change
    create_table :users_bests do |t|
      t.integer :dishes_id
      t.integer :venue_id
      t.integer :user_id

      t.timestamps
    end
  end
end

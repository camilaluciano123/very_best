class AddVenueReferenceToUsersBests < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :users_bests, :venues
    add_index :users_bests, :venue_id
    change_column_null :users_bests, :venue_id, false
  end
end

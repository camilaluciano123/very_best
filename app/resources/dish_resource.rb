class DishResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :dish_name, :string
  attribute :cuisine_id, :integer

  # Direct associations

  has_many   :users_bests,
             foreign_key: :dishes_id

  belongs_to :cuisine

  # Indirect associations
end

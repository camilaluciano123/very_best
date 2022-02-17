class UsersBestResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :dishes_id, :integer
  attribute :venue_id, :integer
  attribute :user_id, :integer

  # Direct associations

  belongs_to :user

  # Indirect associations

end

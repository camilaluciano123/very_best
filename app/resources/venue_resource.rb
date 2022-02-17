class VenueResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :venue_name, :string
  attribute :address, :string
  attribute :neighborhood, :string

  # Direct associations

  has_many :users_bests

  # Indirect associations
end

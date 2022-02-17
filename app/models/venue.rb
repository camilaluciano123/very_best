class Venue < ApplicationRecord
  # Direct associations

  has_many   :users_bests,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    venue_name
  end

end

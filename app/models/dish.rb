class Dish < ApplicationRecord
  # Direct associations

  belongs_to :cuisine

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    dish_name
  end

end

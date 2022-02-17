class UsersBest < ApplicationRecord
  # Direct associations

  belongs_to :venue

  belongs_to :dishes,
             class_name: "Dish"

  belongs_to :user

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    dishes.to_s
  end
end

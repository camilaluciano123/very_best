class Dish < ApplicationRecord
  # Direct associations

  has_many   :users_bests,
             :foreign_key => "dishes_id",
             :dependent => :destroy

  belongs_to :cuisine

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    dish_name
  end

end

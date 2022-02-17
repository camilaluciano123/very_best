class User < ApplicationRecord
  # Direct associations

  has_many   :users_bests,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    username
  end

end

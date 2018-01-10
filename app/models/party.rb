class Party < ApplicationRecord
  # Direct associations

  has_many   :rotations,
             :dependent => :destroy

  # Indirect associations

  # Validations

end

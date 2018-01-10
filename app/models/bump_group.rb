class BumpGroup < ApplicationRecord
  # Direct associations

  has_many   :rotations,
             :dependent => :destroy

  has_many   :members,
             :dependent => :destroy

  # Indirect associations

  # Validations

end

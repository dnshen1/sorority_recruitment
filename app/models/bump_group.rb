class BumpGroup < ApplicationRecord
  # Direct associations

  has_many   :rotations,
             :dependent => :destroy

  has_many   :members,
             :dependent => :destroy

  # Indirect associations

  has_many   :parties,
             :through => :rotations,
             :source => :party

  # Validations

end

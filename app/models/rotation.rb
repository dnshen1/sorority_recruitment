class Rotation < ApplicationRecord
  # Direct associations

  belongs_to :party

  belongs_to :bump_group

  # Indirect associations

  # Validations

end

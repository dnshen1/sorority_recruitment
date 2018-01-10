class Conversation < ApplicationRecord
  # Direct associations

  belongs_to :party

  belongs_to :member

  # Indirect associations

  # Validations

end

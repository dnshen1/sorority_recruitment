class Conversation < ApplicationRecord
  # Direct associations

  belongs_to :ppm,
             :class_name => "Pnm",
             :foreign_key => "pnm_id"

  belongs_to :party

  belongs_to :member

  # Indirect associations

  # Validations

end

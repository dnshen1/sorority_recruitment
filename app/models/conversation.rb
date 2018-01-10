class Conversation < ApplicationRecord
  # Direct associations

  belongs_to :ppm,
             :class_name => "Pnm",
             :foreign_key => "pnm_id"

  belongs_to :party

  belongs_to :member

  # Indirect associations

  has_one    :bump_group,
             :through => :member,
             :source => :bump_group

  # Validations

end

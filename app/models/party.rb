class Party < ApplicationRecord
  # Direct associations

  has_many   :conversations,
             :dependent => :destroy

  has_many   :pnms,
             :dependent => :destroy

  has_many   :rotations,
             :dependent => :destroy

  # Indirect associations

  # Validations

end

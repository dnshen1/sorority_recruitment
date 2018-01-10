class Party < ApplicationRecord
  # Direct associations

  has_many   :conversations,
             :dependent => :destroy

  has_many   :pnms,
             :dependent => :destroy

  has_many   :rotations,
             :dependent => :destroy

  # Indirect associations

  has_many   :bump_groups,
             :through => :rotations,
             :source => :bump_group

  # Validations

end

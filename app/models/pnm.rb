class Pnm < ApplicationRecord
  # Direct associations

  has_many   :conversations,
             :dependent => :destroy

  belongs_to :party

  # Indirect associations

  has_many   :members,
             :through => :conversations,
             :source => :member

  # Validations

end

class Member < ApplicationRecord
  # Direct associations

  has_many   :conversations,
             :dependent => :destroy

  belongs_to :bump_group

  # Indirect associations

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end

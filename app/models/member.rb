class Member < ApplicationRecord
  # Direct associations

  has_many   :conversations,
             :dependent => :destroy

  belongs_to :bump_group

  # Indirect associations

  has_many   :ppms,
             :through => :conversations,
             :source => :ppm

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end

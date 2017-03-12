class Profile < ActiveRecord::Base
  # Active Records Associations Documentation
  belongs_to :user
  # EXAMPLE: has_many :images (see example in profile controller)
end
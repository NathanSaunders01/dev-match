class Profile < ActiveRecord::Base
  # Active Records Associations Documentation
  belongs_to :user
  # EXAMPLE: has_many :images (see example in profile controller)
  has_attached_file :avatar, 
                    :styles { :medium "300x300>", :thumb "100x100>" }, 
                    :default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
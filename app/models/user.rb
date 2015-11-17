class User < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  has_many :locations
  has_many :comments, dependent: :destroy
  has_secure_password

  validates :email, uniqueness: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  validates :first_name, presence: true
  validates :last_name, presence: true
end

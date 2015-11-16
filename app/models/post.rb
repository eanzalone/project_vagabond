class Post < ActiveRecord::Base
	has_many :comments
	belongs_to :user
	belongs_to :location
	acts_as_taggable

	
	validates :title, presence: true, length: { maximum: 25 }
end

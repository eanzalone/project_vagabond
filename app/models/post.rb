class Post < ActiveRecord::Base
	has_many :comments
	belongs_to :user
	belongs_to :location
	has_many :posts_tags 
	# has_many :tags through :posts_tags
	
	validates :title, presence: true, length: { maximum: 25 }
	validates :body, presence: true, length: { maximum: 200 }
end

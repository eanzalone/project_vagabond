class Comment < ActiveRecord::Base
	belongs_to :post

	validates :feedback, presence: true, length: { minimum: 1 }
	validates :feedback, presence: true, length: { maximum: 200 }
end

class Location < ActiveRecord::Base
	has_many :posts
	extend FriendlyId
	friendly_id :name, use: :slugged

	def self.names
		return Location.all.map { |l| l.name }
	end
end

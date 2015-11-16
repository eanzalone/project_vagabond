class Location < ActiveRecord::Base
	has_many :posts

	def self.names
		return Location.all.map { |l| l.name }
	end
end

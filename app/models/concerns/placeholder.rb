module Placeholder
    extend ActiveSupport::Concern

	def self.image_generator (width: , height:)
		"https://place-hold.it/#{width}x#{height}"
	end



end
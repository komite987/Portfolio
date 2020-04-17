class Skill < ApplicationRecord
	include Placeholder
    validates_presence_of :title, :percent

    after_initialize :set_default

    def set_default
    	self.badge ||= Placeholder.image_generator(width: '250', height: '250')
    end

end

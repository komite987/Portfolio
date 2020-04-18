class Portfolio < ApplicationRecord
	has_many :technologies
	include Placeholder

  accepts_nested_attributes_for :technologies,
                                reject_if: lambda { |attrs| attrs['name'].blank? }

    validates_presence_of :title, :body, :main_img, :thumb_img


    def self.angular
    	Portfolio.where(subtitle: "Angular")    	
    end

    scope :Ruby_on_rails, -> { where(subtitle: "Ruby on Rails")}

    after_initialize :set_default

    def set_default
    	self.main_img ||= Placeholder.image_generator(width: '600', height: '300')
    	self.thumb_img ||= Placeholder.image_generator(width: "300", height: "200")
    end
end


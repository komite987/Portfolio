class Portfolio < ApplicationRecord
    validates_presence_of :title, :body, :main_img, :thumb_img


    def self.angular
    	Portfolio.where(subtitle: "Angular")    	
    end

    scope :Ruby_on_rails, -> { where(subtitle: "Ruby on Rails")}

    after_initialize :set_default

    def set_default
    	self.main_img ||="https://place-hold.it/600x300"
    	self.thumb_img ||= "https://place-hold.it/300x200"
    end
end


class Portfolio < ApplicationRecord
    validates_presence_of :title, :body, :main_img, :thumb_img


    def self.angular
    	Portfolio.where(subtitle: "Angular")    	
    end

    scope :Ruby_on_rails, -> { where(subtitle: "Ruby on Rails")}
end

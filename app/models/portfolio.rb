class Portfolio < ApplicationRecord
	has_many :technologies, dependent: :destroy

    include RailsSortable::Model
    set_sortable :sort

    def self.by_position
        order("position ASC")        
    end

    accepts_nested_attributes_for :technologies,
                                reject_if: lambda { |attrs| attrs['name'].blank? }

    validates_presence_of :title, :body, :main_img, :thumb_img

    mount_uploader :thumb_img, PortfolioUploader
    mount_uploader :main_img, PortfolioUploader


    def self.angular
    	Portfolio.where(subtitle: "Angular")    	
    end

    scope :Ruby_on_rails, -> { where(subtitle: "Ruby on Rails")}


end


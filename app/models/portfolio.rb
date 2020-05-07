class Portfolio < ApplicationRecord
	has_many :technologies, dependent: :destroy
    accepts_nested_attributes_for :technologies,
                                   allow_destroy: true,
                                   reject_if: lambda { |attrs| attrs['name'].blank? }


    include RailsSortable::Model
    set_sortable :sort

    def self.by_position
        order("position ASC")        
    end


    validates_presence_of :title, :body

    mount_uploader :thumb_img, PortfolioUploader
    mount_uploader :main_img, PortfolioUploader


    def self.angular
    	Portfolio.where(subtitle: "Angular")    	
    end

    scope :Ruby_on_rails, -> { where(subtitle: "Ruby on Rails")}


end


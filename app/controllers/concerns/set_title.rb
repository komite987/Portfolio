module SetTitle
  extend ActiveSupport::Concern

  included do 
    before_action :set_page_default
  end

  def set_page_default
    @page_title = "My Portfolio | Home"
    @seo_keywords = "Komait Portfolio"
  end
end
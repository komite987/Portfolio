module ApplicationHelper

  def alerts
    alert = (flash[:alert] || flash[:error] || flash[:notice])
    if alert
   js add_gritter(alert, :image => :notice, :title => "Pay attention!", :fade_out_speed => "slow", :time => 5000, :sticky => false)
    end
  end


  def nav_links style = ""
    if current_user.is_a?(GuestUser)
      (link_to 'Log in', new_user_session_path, class: style) + "  ".html_safe +
      (link_to 'Sign up', new_user_registration_path, class: style)
    else 
      link_to 'Log out', destroy_user_session_path, method: :delete, class: style
    end
  end

  def source_method(layout)
    if session[:source]
      greeting =  "Thanks for visiting from #{session[:source]} and you are in #{layout} layout"
        content_tag(:p, greeting, class: "greet-source")
    end
  end

  def copyright_generator
    KomaitViewTool::Renderer.copyright "Komait", "All rights reserved"
  end

  def nav_items 
 [ {url: root_path, title: 'Home'},
      {url: about_path, title: 'About Me'},
      {url: contact_path, title: 'Contact us'},
      {url: posts_path, title: 'Blog'},
      {url: portfolios_path, title: 'Portfolio'},
      {url: tech_news_path, title: 'Rails Tweets'}
    ]
  end
  
  def nav_helper style, tag
    nav_links = '' 

    nav_items.each do |item|
      nav_links << "<#{tag}><a href='#{item[:url]}' 
      class='#{style} #{active? item[:url]}'>#{item[:title]}</a></#{tag}>"
    end
  nav_links.html_safe
  end

  def active? path
    "active" if current_page? path    
  end



  # bootstrap flash
  # def bootstrap_class_for flash_type
  #   { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }.stringify_keys[flash_type.to_s] || flash_type.to_s
  # end

  # def flash_messages(opts = {})
  #   flash.each do |msg_type, message|
  #     concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)}", role: "alert") do 
  #             concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
  #             concat message 
  #           end)
  #   end
  #   nil
  # end

end

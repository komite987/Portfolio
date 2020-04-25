module ApplicationHelper

  def nav_links
    if current_user.is_a?(User)
        link_to 'Log out', destroy_user_session_path, method: :delete
    else 
        (link_to 'Log in', new_user_session_path) + " | " +
        (link_to 'Sign up', new_user_registration_path)
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
end

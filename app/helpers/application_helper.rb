module ApplicationHelper
  def login_helper(style: nil, tag_type: 'span')
    login_links = [ {url: new_user_registration_path, title: 'Signup' }, { url: new_user_session_path, title: 'Login' }]
    if current_user.is_a?(GuestUser)
      nav_links = ''
      login_links.each do |item|
        nav_links += "<#{tag_type}><a href=#{item[:url]} class= '#{style} #{active(item[:url])}'>#{item[:title]}</a></#{tag_type}>"
      end
      nav_links.html_safe
    else
      "<#{tag_type}> #{link_to 'Logout', destroy_user_session_path, method: :delete, class: style}".html_safe
    end
  end

  def source_helper(layout)
    if session[:source].present?
      content_tag :p, "Thank for visiting me from #{session[:source]}", class: "#{layout}-source-greeting"
    end
  end

  def set_copyright
    "&copy; #{Time.now.year} | <b>Shabbir Saifee</b> All right reserved".html_safe
  end

  def nav_items
    [
      {
        url: root_path,
        title: 'Home'
      },

      {
        url: about_me_path,
        title: 'About'
      },

      {
        url: contact_path,
        title: 'Contact'
      },

      {
        url: tech_blogs_path,
        title: 'Tech Blog'
      },
      
      {
        url: food_blogs_path,
        title: 'Food Blog'  
      },

      # {
      #   url: portfolios_path,
      #   title: 'Portfolio'
      # },

      # {
      #   url: tech_news_path,
      #   title: 'Tech News'
      # }

    ]
  end

  def nav_helper(style: nil, tag_type: 'span')
    nav_links = ''
    nav_items.each do |item|
      nav_links += "<#{tag_type}><a href=#{item[:url]} class= '#{style} #{active(item[:url])}'>#{item[:title]}</a></#{tag_type}>"
    end

     nav_links.html_safe
  end

  def active(path)
    "active" if current_page? path
  end

  def set_alerts
    if flash[:alert]
      alert(flash[:alert], :alert)
    elsif flash[:error]
      alert(flash[:alert], :error, 'Error')
    else
      alert(flash[:notice])
    end
  end

  def alert(msg, type = :notice, title = '')
    js add_gritter(msg, image: type, sticky: false, title: title)
  end
end

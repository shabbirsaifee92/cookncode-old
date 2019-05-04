module ApplicationHelper
  def login_helper(css_class=nil)
    if current_user.is_a?(GuestUser)
      (link_to 'Sign Up', new_user_registration_path, class: "#{css_class} #{active new_user_registration_path}") +
      ' '.html_safe +
      (link_to 'Login', new_user_session_path, class: "#{css_class} #{active new_user_session_path}")
    else
      link_to 'Logout', destroy_user_session_path, method: :delete, class: css_class
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
        url: blogs_path,
        title: 'Blog'
      },

      {
        url: portfolios_path,
        title: 'Portfolio'
      },

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
end

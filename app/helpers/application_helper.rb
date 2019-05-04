module ApplicationHelper
  def login_helper(css_class=nil)
    if current_user.is_a?(GuestUser)
      (link_to 'Sign Up', new_user_registration_path, class: css_class) + 
      ' '.html_safe +
      (link_to 'Login', new_user_session_path, class: css_class)
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

  def nav_helper(style: nil, tag_type: 'span')
nav_links = <<NAV
<#{tag_type}><a href="#{root_path}" class="#{style}">Home</a></#{tag_type}>
<#{tag_type}><a href="#{about_me_path}" class="#{style}">About</a></#{tag_type}>
<#{tag_type}><a href="#{contact_path}" class="#{style}">Contact</a></#{tag_type}>
<#{tag_type}><a href="#{blogs_path}" class="#{style}">Blog</a></#{tag_type}>
<#{tag_type}><a href="#{portfolios_path}" class="#{style}">Portfolios</a></#{tag_type}>
NAV
    nav_links.html_safe
  end
end

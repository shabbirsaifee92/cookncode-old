module ApplicationHelper
  def login_helper
    if current_user.is_a?(User)
      link_to 'Logout', destroy_user_session_path, method: :delete
    else
      (link_to 'Sign Up', new_user_registration_path) + ' ' +
      (link_to 'Login', new_user_session_path)
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
end

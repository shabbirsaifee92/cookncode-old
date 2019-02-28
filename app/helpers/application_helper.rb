module ApplicationHelper
  def sample_helper
    "<p> Hello Helper<p>".html_safe
    "<div> <h2>This is another helper message </h2> </div>".html_safe
  end

  def login_helper
    if current_user.is_a?(User)
      link_to 'Logout', destroy_user_session_path, method: :delete
    else
      (link_to 'Sign Up', new_user_registration_path) + ' ' +
      (link_to 'Login', new_user_session_path)
    end
  end
end

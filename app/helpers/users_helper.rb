module UsersHelper
  def user_session
    if user_signed_in?
      content_tag :div, class: 'text-center py-3' do
        (button_to 'sign out', destroy_user_session_path, method: :delete, class: 'btn btn-primary w-20 mb-3') 
         
      end
    else
      content_tag :div, class: 'text-center py-3' do
        (button_to 'sign in', new_user_session_path, class: 'btn btn-primary w-20 mb-3') +
          (link_to 'sign up', new_user_registration_path, class: 'btn btn-dark w-20 mb-3')
      end
    end
  end
end

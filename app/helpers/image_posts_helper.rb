module ImagePostsHelper
    def require_user
        if !logged_in?
          flash[:alert] = "You neet to log in to perform that action"
          redirect_to new_session_path
        end
    end
end

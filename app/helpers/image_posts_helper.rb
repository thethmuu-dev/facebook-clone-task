module ImagePostsHelper
    def require_user
        if !logged_in?
          flash[:alert] = "You neet to log in to perform that action"
          redirect_to new_session_path
        end
    end

    def choose_new_or_edit_image
      if action_name == 'new' || action_name == 'create'
        confirm_image_posts_path
      elsif action_name == 'edit'
        image_post_path
      end
    end
end

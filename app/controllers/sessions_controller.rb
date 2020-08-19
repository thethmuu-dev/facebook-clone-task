class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to image_posts_path, notice: "Logged In!"
    else
      flash.now[:alert] = 'Login Failed!'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:notice] = "Logged Out!"
    redirect_to root_path
  end
end

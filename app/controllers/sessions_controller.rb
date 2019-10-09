class SessionsController < ApplicationController
  skip_before_action :require_login, except: :destroy

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:alert] = 'no user'
      render 'create'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end

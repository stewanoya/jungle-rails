class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to :root
    else
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    # Might change to root, since visitors and users can view entire site.
    redirect_to :root
  end

end

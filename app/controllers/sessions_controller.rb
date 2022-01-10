class SessionsController < ApplicationController

  def new
  end

  def create
    if user = User.authenticate_with_credentials(params[:email], params[:password])
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

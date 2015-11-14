class SessionsController < ApplicationController
 
  # show the login form
  def new
    # TODO: render a login form view
  end

  # create the session, logging in the user
  def create
    user = User.confirm(params[:email], params[:password])
    if user && user.authenticate(params[:email])
      # save the user's id into the session
      session[:user_id] = user.id
      #redirect to the show page
      redirect_to posts_path, notice: "Logged in!"
    else
      #there was an error logging the user in
      flash.now.alert = "Email or password is invalid"
      render "new"
    end
  end
  
  # logout the current user
  def destroy
    session[:user_id] = nil
    # flash[:notice] = "Successfully logged out."
    redirect_to users_path
    flash[:notice] = "Successfully logged out."
  end

end

class SessionsController < ApplicationController
 
  # show the login form
  def new
    # TODO: render a login form view
  end

  # create the session, logging in the user
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
     # save the user's id into the session
     session[:user_id] = user.id
     #redirect to the show page
     redirect_to root_url
    else
      #there was an error logging the user in
      render :new 
    end
  end
  
  # logout the current user
  def destroy
    session[:user_id] = nil
    # flash[:notice] = "Successfully logged out."
    redirect_to root_url, notice: "Successfully logged out."
  end

end

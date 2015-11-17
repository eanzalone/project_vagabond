class SessionsController < ApplicationController
 
  # show the login form
  def new
    # TODO: render a login form view
  end

  # create the session, logging in the user
  def create
   # byebug
   user = User.find_by(email: user_params[:email])
   if user && user.authenticate(user_params[:password])
    # save the user's id into the session
    session[:user_id] = user.id
    #redirect to the show page
    redirect_to root_url
   else
     #there was an error logging the user in
     flash[:danger] = "Invalid email/password combination"
     render :new 
   end
 end
  
  # logout the current user
  def destroy
    session[:user_id] = nil
    # flash[:notice] = "Successfully logged out."
    redirect_to root_url, notice: "Successfully logged out."
  end

  private

   def user_params
     params.require(:user).permit(:email, :password)
   end
end

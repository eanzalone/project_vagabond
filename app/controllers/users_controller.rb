class UsersController < ApplicationController
	before_action :auth_user?, only: :edit

	def index
		@user = User.all
		render :index
	end

	def new 
		@user = User.new
	end

	def create
		user_params = params.require(:user).permit(:first_name, :last_name, :email, :password, :neighborhood)
		@user = User.new(user_params)
		if @user.save	
			session[:user_id] = @user.id
			redirect_to posts_path
		else 
			render :new
		end
	end

	def show
		@user = User.find(params[:id])
		render :show
	end

	def edit
		id = params[:id]
		@user = User.find(id)
		render :edit
	end


	def update                
		@user = User.find(params[:id])
		updated_attributes = params.require(:user).permit(:first_name, :last_name)
		@user.update_attributes(updated_attributes)
		redirect_to @user 
	end

	def auth_user?
    # layout: false prevents the application layout page from loading
    # returning false/true stops/allows the action
    unless current_user.id == params[:id].to_i
      render file: 'public/401.html', status: 401, layout: false
      false
    else
      true
    end
  end

end

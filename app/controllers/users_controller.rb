class UsersController < ApplicationController
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
			redirect_to sign_up_path
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

end

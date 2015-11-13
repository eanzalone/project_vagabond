class UsersController < ApplicationController
	def index
		@user = User.all
		render :index
	end

	def new 
		@user = User.new
		render :new
	end

	def create
		user_params = params.require(:user).permit(:first_name, :last_name, :email, :password, :neighborhood)
		@user = User.create(user_params)
		login(@user)
		redirect_to user_path(@user)
	end

	def show
		@user = User.find(params[:id])
		render :show
	end

end

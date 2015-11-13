class PostsController < ApplicationController
	def index
		@post = Post.new
	end
	def new 
		@post = Post.new
		render :new
	end
	def create
		# user = User.find(session[:user_id])

		post_params = params.require(:post).permit(:title, :body)
		@location = Location.where(name: params[:post][:location]).first
		@post = current_user.posts.new(post_params)
		@post.update(location_id: @location.id)
		# post = Post.create(post_params)
		if @post.save
			redirect_to post_path(@post[:id])
		end
	end
	def show
		@post = Post.find(params[:id])
	end
end

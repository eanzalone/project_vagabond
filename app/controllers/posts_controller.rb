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

	def edit 
		id = params[:id]
		@post = Post.find(id)
		render :edit
	end 

	def update
		@post = Post.find(params[:id])
		updated_attributes = params.require(:post).permit(:title, :body)
		@post.update_attributes(updated_attributes)
		redirect_to @post
	end

	def destroy
	  	id = params[:id]
		@post = Post.find(id)
		@post.destroy
		redirect_to @post
	end
end

class PostsController < ApplicationController
	def index

		if params[:tag]
			@posts = Post.tagged_with(params[:tag])
		else 
			@posts = Post.all
		end

	end

	def new 
		@post = Post.new
		@comment = Comment.new
	end

	def create
		# user = User.find(session[:user_id])
		post_params = params.require(:post).permit(:title, :body, :tag_list)
		@location = Location.where(name: params[:post][:location]).first
		@post = current_user.posts.new(post_params)
		@post.update(location_id: @location.id)
		# post = Post.create(post_params)
		if @post.save
			redirect_to location_path(@location[:id])
		else
			render :new
		end
	end
	
	def show
		@post = Post.find(params[:id])
		@comment = Comment.new
	end

	def edit 
		id = params[:id]
		@post = Post.find(id)
		render :edit
	end 

	def update
		@post = Post.find(params[:id])
		updated_attributes = params.require(:post).permit(:title, :body, :tag_list)
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

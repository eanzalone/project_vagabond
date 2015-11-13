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

		post_params = params.require(:post).permit(:title, :body, :address)
		@post = current_user.posts.new(post_params)
		p "This is the post: #{params[:post]}"
		p params
		post = Post.create(post_params)
		if @post.save
			redirect_to new_post_path(user) #Needs fix
		end
	end
	def show
	end
end

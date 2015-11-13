class PostsController < ApplicationController
	def index
		@post = Post.new
	end
	def new 
		@post = Post.new
		render :new
	end
	def create
		user = User.find(params[:user_id])
		post_params = params.require(:post).permit(:title, :body)
		p "This is the post: #{params[:post]}"
		p params
		post = Post.create(post_params)
		if post.save
			user.posts << post
		# current_user << @post
		redirect_to user_path(user) #Needs fix
		end
	end
	def show
	end
end

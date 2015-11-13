class PostsController < ApplicationController
	def index
		@post = Post.new
	end
	def new 
		@post = Post.new
		render :new
	end
	def create
		post_params = params.require(:post).permit(:title, :body)
		p "This is the post: #{params[:post]}"
		p params
		Post.create(post_params)
		redirect_to '/users/1' #Needs fix redirect
	end
	def show
	end
end

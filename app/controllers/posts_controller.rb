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
<<<<<<< HEAD
		Post.create(post_params)
		redirect_to '/users/2'
	end
	def show
=======
		@@posty = Post.create(post_params)
		redirect_to '/users/2'
	end
	def show
		@@posty
>>>>>>> febdf2e78303b6cfdd56d58da6a19eb2c4b8b8c1
	end
end

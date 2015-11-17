class CommentsController < ApplicationController

	def show
		@post = Post.find(params[:post_id])
		@comment = Comment.find(params[:id])
	end

	def create

		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(params[:comment].permit(:feedback))
		if @comment.save
			redirect_to @post
		else
			@post = Post.find(params[:post_id])
			render 'posts/show'
		end
	end

	def destroy
		id = params[:id]
		@comment = Comment.find(id)
		@post = @comment.post
		@comment.destroy
		redirect_to @post
	end

	private
	def comment_params
		params.require(:comment).permit(:feedback)
	end
end

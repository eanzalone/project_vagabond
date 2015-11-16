class CommentsController < ApplicationController

	def show
		@post = Post.find(params[:post_id])
		@comment = Comment.find(params[:id])
	end

	def create

		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(params[:comment].permit(:feedback))
		p @comment[:id]
		redirect_to @post
		# redirect_to post_comment_path(@comment[:id])
		# # if @comment.save
		# # 	@post.comment << @comment
		# # 	redirect_to [@post, @comment]
		# # else
		# # 	render 'posts/show'
		# end
	end
	def destroy
	  	id = params[:id]
	  	# @post = Post.find(params[:post_id])
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

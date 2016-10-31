class CommentsController < ApplicationController
	before_filter :authenticate_user!, only: [:create, :edit, :update, :destroy]

	def create
		@post = Post.find(params[:post_id]) 
		@comments = @post.comments.create(params[:comment].permit(:name, :body))
		redirect_to post_path(@post)
	end

	def destroy
    comment = Comment.find(params[:id])
    comment.destroy if comment.user = current_user
    flash[:succes] = "comment deleted."
    redirect_to :back
  end
end

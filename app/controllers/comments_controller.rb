class CommentsController < ApplicationController
	before_filter :authenticate_user!, only: [:create, :edit, :update, :destroy]
	def comments 
		@comments = Comment.order(created_at: :desc)
	end
	def create
		
		@post = Post.find(params[:post_id]) 
		@comments = @post.comments.create(params[:comment].permit(:name, :body))
		redirect_to post_path(@post)
	end
end

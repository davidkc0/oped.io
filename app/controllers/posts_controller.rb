class PostsController < ApplicationController 
	before_action :authenticate_user!
	def posts
		@posts = Post.order(created_at: :desc)
	end


	def new 
		@post = Post.new 
	end 

	def create 
		@post = current_user.posts.new(post_params)
		if @post.save 
		redirect_to post_path(@post)
		else 
			render :new 
		end
	end 

	def show
		@post = Post.find(params[:id])
	end


	private 
	def post_params
		params.require(:post).permit(:title, :body, :all_tags)
	end 
end 


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

	def edit
		@post = Post.find(params[:id])
	end

	def update
	  @post = Post.find(params[:id])
	  if @post.update(params[:post].permit(:title, :body, :tags))
	  	redirect_to @post
	  else 
	  	render 'edit' 
	end
end

	def destory
		@post = Post.find(params[:id])
		@post.destory

		redirect_to root_path
	end




	private 
	def post_params
		params.require(:post).permit(:title, :body, :all_tags)
	end 
end 


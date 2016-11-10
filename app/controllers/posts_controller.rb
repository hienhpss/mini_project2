class PostsController < ApplicationController
	before_action :find_post, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, only: [:create, :new, :show, :edit, :update, :destroy]
	

	#before_action :set_event, :only => [ :show, :edit, :update, :destroy]

	def index
		Rails.logger.info current_user
		@posts = Post.all.order('created_at DESC')
	end

	def new
		puts current_user
		@post = current_user.posts.build
	end

	def create
		@post = current_user.posts.build(post_params)
		if @post.save
			redirect_to @post
		else
			render "new"
		end
	end

	def show
		
	end

	def edit
		
	end

	def udpate
		if @post.update(post_params)
			redirect_to @post
		else
			render 'edit'
		end
	end

	def destroy
		@post.destroy
		redirect_to posts_path

	end

	private
	def find_post
		@post = Post.find(params[:id])
		
	end

	def post_params
		params.require(:post).permit(:title, :body)
	end

end

class PostsController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @posts = Post.all
    end
    
    def new
        @post = current_user.posts.build
    end
    
    def create
        @post = current_user.posts.build(post_params)
        if @post.save
            redirect_to posts_path
        else
            render 'new'
        end
    end
    
    def edit
        @post = Post.find(params[:id])
        render 'new'
        if @post.update
            redirect_to posts_path
        else
            render 'new'
        end
    end
    
    def destroy
        @post = Post.find(params[:id])
        @post.destroy
    end
    
    private
        def post_params
            params.require('post').permit(:content)
        end
            
end

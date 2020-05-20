class UsersController < ApplicationController
    def index
        @users = User.all
    end
    def show 
        @user = current_user
        @posts = Post.where("user_id = ?", current_user.id )
    end
end

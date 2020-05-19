class UsersController < ApplicationController
    def show 
        @user = current_user
        @posts = Post.where("user_id = ?", current_user.id )
    end
end

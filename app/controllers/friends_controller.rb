class FriendsController < ApplicationController
    def create
        @user = User.find(params[:user_id])
        @friend = current_user.self_confirmings.build(friend_id: @user.id)
        @request = current_user.ic_requests.find_by("user_id = ?", @user.id)
        if @friend.save
            @request.destroy
            redirect_to users_path
        else
            redirect_to users_path
        end
    end
    
    def destroy
        @user = User.find(params[:user_id])
        if not current_user.self_confirmings.where("friend_id = ?", @user.id).empty?
            @friend = current_user.self_confirmings.find_by("friend_id = ?" , @user.id)
            @friend.destroy
        end
        
        if not current_user.they_confirmings.where("user_id = ? ", @user.id).empty? 
            @friend = current_user.they_confirmings.find_by("user_id = ? ", @user.id)
            @friend.destroy
        end
        redirect_to users_path
    end
end

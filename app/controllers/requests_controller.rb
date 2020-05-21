class RequestsController < ApplicationController
    def create
        @user=User.find(params[:user_id])
        @request = current_user.og_requests.build(to_user_id: @user.id)
        if @request.save
           redirect_to users_path
        else
            redirect_to users_path
        end
    end
    
    def destroy
        @user = User.find(params[:user_id])
        if not current_user.og_requests.where("to_user_id = ?" , @user.id).empty?
            @request = current_user.og_requests.find_by("to_user_id = ?" , @user.id)
            @request.destroy
        end
        if not current_user.ic_requests.where("user_id = ?" , @user.id).empty?
            @request = current_user.ic_requests.find_by("user_id = ?", @user.id)
            @request.destroy
        end
        redirect_to users_path
    end
end

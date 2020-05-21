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
        @request = current_user.ic_requests.find(params[:id])
        @request.destroy
        redirect_to users_path
    end
end

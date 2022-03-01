class UsersController < ApplicationController
    def index
        users = User.all
        render :json => users
    end

    def create
        user = User.new(user_params)
        if user.save
            render :json => user
        else
            render :json => user.errors.full_messages, :status => :unprocessable_entity
        end
    end

    def show
        # /users/:id
        user = User.find_by(:id => params[:id])

        render :json => user
    end

    def update
        user = User.find_by(:id => params[:id]) # fetch the user id
        if user.update(user_params) # update the user id with the new user_params
            render :json => user
        else
            render :json => user.errors.full_messages, :status => :unprocessable_entity
        end
    end

    def destroy
        user = User.find_by(:id => params[:id])
        user.destroy

        render :json => user
    end

    protected
    
    def user_params
        params.require(:users).permit(:name,:email)
    end
end
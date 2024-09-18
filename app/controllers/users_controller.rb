class UsersController < ApplicationController

    

    before_action :set_user, only: %i[:show :edit :update :destroy]

    def index #+
        @users = User.all
        render json: @users
    end

    def show #+
        @user = User.find(params[:id])
        render json: @user
    end 

    def new #+
        @user = User.new
        render json: {message: 'User was created successfully'}
    end 

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to @user
            
        else
            render json: @user.errors, status: :unprocessable_entity
        end

        
    end

    def edit #+

    end

    def update
        if @user.update(user_params)
            redirect_to @user
        else 
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy 
        @user.destroy
        redirect_to users_url, status: :see_other
    end

    private

    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:email, :encrypted_password, :name, :phone_number, :country, :contacts, :pricing)
    end
end

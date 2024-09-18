class OrdersController < ApplicationController
    before_action :set_user
    before_action :set_order, only: %i[show edit update destroy]

    def index
        @orders = @user.orders
    end

    def show
        render json: @order
    end 

    def new
        @order = @user.orders.new
    end 

    def create
        @order = @user.orders.new(order_params)
        if @order.save
            redirect_to user_order_path(@user, @order)
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit 
    end

    def update
        if @order.update(order_params)
            redirect_to user_orders_path(@user)
        else 
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @order.destroy
        redirect_to user_orders_path(@user), status: :see_other
    end

    private

    def set_order
        @order = @user.orders.find(params[:id])
    end

    def set_user
        @user = User.find(params[:user_id]) 
    end

    def order_params
        params.require(:order).permit(:cost, :deadline, :description, :title)
    end
end

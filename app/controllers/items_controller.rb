class ItemsController < ApplicationController

    def index
        @items = Item.all
        render json: @items
    end

    def show
        @item = Item.find([params[:id]])
        render json: @item
    end

    def create
        @item = Item.new(item_params)
        if @item.save
            render json: @item, status: 201
        else
            render json: @item.errors, status: 422
        end
    end

    def destroy
        @item = Item.find(params[:id])
        if @item && @item.destroy
            render json: @item, status: 200
        else
            render json: { errors: "Could not destroy item " }, status: 400
        end
    end

    private

    def item_params
        params.require(:item).permit(:name, :category)
    end
end

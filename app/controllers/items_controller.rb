class ItemsController < ApplicationController

    def index
        @items = Item.all

    end

    def create
        item =Item.create(items_params)
        if item.persisted?
            redirect_to items_path
        else
            render json: item.errors, status: :unprocessable_entity
        end
    end

    def new

    end

    def show
        unless (@item = Item.where(id: params[:id]).first)
            render body: 'Page not found', status: 404
        end
    end

    def edit
        unless (@item = Item.where(id: params[:id]).first)
            render body: 'Page not found', status: 404
        end
    end

    def update
        item = Item.where(id: params[:id]).update(items_params).first
        if item.update(items_params)
        redirect_to item_path
        else
            render json: item.errors, status: :unprocessable_entity
        end
    end

    def destroy
        item = Item.where(id: params[:id]).first.destroy
        if item.destroyed?
            redirect_to items_path
        else
            render json: item.errors, status: :unprocessable_entity
        end
    end

    private

    def items_params
        params.permit(:owner, :name, :description)
    end
end

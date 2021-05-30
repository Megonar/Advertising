class ItemsController < ApplicationController

    before_action :find_item, only: %i[show edit update destroy]

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
        render body: 'Page not found', status: 404 unless @item
    end

    def edit
        render body: 'Page not found', status: 404 unless @item
    end

    def update
        if @item.update(items_params)
        redirect_to item_path
        else
            render json: item.errors, status: :unprocessable_entity
        end
    end

    def destroy
        if @item.destroy.destroyed?
            redirect_to items_path
        else
            render json: item.errors, status: :unprocessable_entity
        end
    end

    private

    def items_params
        params.permit(:owner, :name, :description)
    end

    def find_item
        @item = Item.where(id: params[:id]).first
    end
end

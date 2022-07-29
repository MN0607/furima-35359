class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :get_item_params, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]

  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    @item_tag = ItemsTag.new

    # 当初のコード
    #@item = Item.new
  end

  def create
    @item_tag = ItemsTag.new(item_tag_params)
    if @item_tag.valid?
      @item_tag.save
      redirect_to root_path
    else
      render :new
    end

    # 当初のコード
    #@item = Item.new(item_params)
    #if @item.save
      #redirect_to root_path
    #else
      #render :new
    #end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    redirect_to root_path if @item.destroy
  end

  def search
    return nil if params[:keyword] == ""
    tag = Tag.where(['tag_name LIKE ?', "%#{params[:keyword]}%"] )
    render json:{ keyword: tag }
  end

  private

  def item_tag_params
    params.require(:items_tag).permit(:trade_name, :explanation, :price, :category_id, :status_id, :shipping_charge_id, :prefecture_id, :days_to_ship_id, :tag_name, :image).merge(user_id: current_user.id)
  end
  
  def item_params
    params.require(:item).permit(:trade_name, :explanation, :category_id, :status_id, :shipping_charge_id, :prefecture_id,
                                 :days_to_ship_id, :price, :image, :tag_name).merge(user_id: current_user.id)
  end

  def get_item_params
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to root_path if current_user != @item.user || @item.order.present?
  end
end
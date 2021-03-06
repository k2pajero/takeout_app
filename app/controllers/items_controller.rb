class ItemsController < ApplicationController
  before_action :move_to_index, except: %i[index show search]
  before_action :search_item, only: [:index, :search, :second_search]

  def index
    @items = Item.all.order(created_at: 'DESC')
    # @basketitems = BasketItems.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    # binding.pry
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @item = Item.find(params[:id])
  end
  
  def search
    @items = Item.search(params[:keyword])
    @results = @p.result.order(created_at: 'DESC')
    set_search
  end

  def second_search
    @results = @p.result.order(created_at: 'DESC')
    set_search
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to root_path, notice: '商品情報を更新しました。'
    else
      render 'edit'
    end
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.destroy
      redirect_to root_path
    else
      render 'show'
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :genre_category_id, :saize_category_id, :speed_id, :image)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def search_item
    @p = Item.ransack(params[:q])  # 検索オブジェクトを生成
  end

  def set_search
    @genre_category = GenreCategory.where.not(id: 0)
    @saize_category = SaizeCategory.where.not(id: 0)
    @speed = Speed.where.not(id: 0)
  end
end

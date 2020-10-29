class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :move_to_index, only: [:index]

  def index
    @item = Item.find(params[:item_id])
    @order_form = OrderForm.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_form = OrderForm.new(form_params)
    if @order_form.valid?
      @order_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def form_params
    params.require(:order_form).permit(:postal_code, :prefectures_id, :city, :address, :building_name, :cellphone_number).merge(user_id: current_user.id,item_id: params[:item_id])
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end
end

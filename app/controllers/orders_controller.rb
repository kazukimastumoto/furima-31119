class OrdersController < ApplicationController
  before_action :set_item , only: [:index, :create]
  before_action :authenticate_user!, only: [:index]
  before_action :move_to_bay, only: :index
  before_action :move_to_index, only: [:index]

  def index
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(form_params)
    if @order_form.valid?
      pay_item
      @order_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def form_params
    params.require(:order_form).permit(:postal_code, :prefectures_id, :city, :address, :building_name, :cellphone_number).merge(user_id: current_user.id,item_id: params[:item_id],token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def move_to_bay
    if @item.order != nil
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: form_params[:token],
      currency: 'jpy'
    )
  end
end

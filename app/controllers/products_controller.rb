class ProductsController < ApplicationController
  before_filter :login_required, :except => [:index, :show]
  
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end
  
  def create
    @order = order
    @order.save
    @product = Product.find(params[:product][:id])
    @order.order_products.create!(:product_id => @product.id, :variant => params[:product][:variants], :price => @product.price, :amount => params[:product][:amount])
    session[:order_id] = @order.id
    flash[:notice] = "Succesfully placed product in your basket."
    redirect_to order_path
  rescue ActiveRecord::RecordInvalid
    flash[:error] = "Product not added to basket, please try again"
    redirect_to product_path(params[:product][:id])
  end

  protected
  def order
    current_order.present? ? current_order : current_user.orders.new
  end
  
end

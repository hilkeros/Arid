class Admin::ProductsController < AdminController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params[:product])
    @product.save!
    redirect_to admin_product_path(@product)
  rescue ActiveRecord::RecordInvalid
    render :new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update_attributes!(params[:product])
    flash[:notice] = "Updated product #{@product.name}"
    redirect_to admin_products_path
  rescue ActiveRecord::RecordInvalid
    render :edit
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = "Deleted product #{@product.name}"
    redirect_to admin_products_path
  end

end

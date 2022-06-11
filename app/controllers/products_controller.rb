class ProductsController < ApplicationController

  skip_before_action :authenticate_user!, :only => [:index]
  before_action :only => [:new, :create, :edit, :update, :destroy] do
    unless current_user && current_user.admin?
      flash[:notice] = "You are not authorized for that action"
      redirect_to root_path 
    end
  end

  def index
    @products = Product.all
    redirect_to index_path
  end

  def all
    @products = Product.all
    render :all
  end

  def new
    @product = Product.new
    render :new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Product successfully added!"
      redirect_to products_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
    render :edit
  end

  def show
    @product = Product.find(params[:id])
    render :show
  end

  def update
    @product= Product.find(params[:id])
    if @product.update(product_params)
      redirect_to product_params
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

  private
    def product_params
      params.require(:product).permit(:name, :cost, :country_of_origin)
    end

end
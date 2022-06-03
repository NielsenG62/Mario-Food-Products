class HomeController < ApplicationController

  skip_before_action :authenticate_user!, :only => [:index]
  before_action :only => [:create, :edit, :update, :destroy] do
    redirect_to root_path unless current_user && current_user.admin?
  end

  def index
    @products = Product.all
    render :index
  end
end
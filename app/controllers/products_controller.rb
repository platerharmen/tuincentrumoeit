class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find_by_id(params[:id])
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      render @product.errors
    end
  end
  
  private

  def product_params
    params.require(:product).permit(
      :name,
      :description,
      :height,
      :img_src,
      :flowering_time_begin,
      :flowering_time_end
    )
  end
  
end

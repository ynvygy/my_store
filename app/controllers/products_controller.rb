class ProductsController < ApplicationController
	before_action :set_product, only:[:show]
	def index
		@category = Category.find(params[:category_id])
		@products = @category.products
	end
	
	def show
	end

	private

    def set_product
      @product = Product.find(params[:id])
    end
end
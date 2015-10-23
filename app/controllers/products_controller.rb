class ProductsController < ApplicationController
	before_action :set_product, only:[:show]
	before_filter :initialize_cart
	def index
		@products = Product.all
	end
	
	def show
	end

	private

    def set_product
      @product = Product.find(params[:id])
    end
end
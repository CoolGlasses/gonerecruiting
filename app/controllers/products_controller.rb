class ProductsController < ApplicationController

    def create
        @product = Product.new(product_params)

        @product.save!
        redirect_back fallback_location: "/"
    end

    protected
    def product_params
        self.params.require(:product).permit(:product_code, :name, :description, :price)
    end
end
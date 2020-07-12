class PurchasesController < ApplicationController

    def create
        @purchase = Purchase.new(purchase_params)

        @purchase.save!
        redirect_back fallback_location: "/"
    end

    protected
    def purchase_params
        self.params.require(:purchase).permit(:user_id, :organization_id, :product_code)
    end
end
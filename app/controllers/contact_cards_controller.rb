class ContactCardsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        render plain: "this is the index action of the ContactCardsController"
    end

    def create
        @contact_card = ContactCard.new(contact_card_params)

        @contact_card.save!
        redirect fallback_location: "/players/#{contact_card_params['player_id']}"
    end

    def new
    end

    def edit
        @contact_card = ContactCard.find_by(id: contact_card_params[:id])

        render :edit
    end

    def update
        @contact_card = ContactCard.find_by(id: contact_card_params[:id])

        if @contact_card.update_attributes(contact_card_params)
            redirect_to contact_card_url(@contact_card)
        else
            render :edit
        end
    end

    def delete
    end

    protected
    def contact_card_params
        self.params.require(:contact_card).permit(:street, :email, :city, :state, :zip, :cell, :phone)
    end
end
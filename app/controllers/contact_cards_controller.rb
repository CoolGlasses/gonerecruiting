class ContactCardsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
    end

    def create
        @contact_info = ContactCard.new(contact_card_params)

        @contact_info.save!
        redirect fallback_location: "/players/#{contact_card_params['player_id']}"
    end

    def new
    end

    def update
    end

    def delete
    end

    protected
    def contact_card_params
        self.params.require(:contact_card)
    end
end
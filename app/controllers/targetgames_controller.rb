class TargetgamesController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
    end

    def create
        @targetgame = Targetgame.new(targetgame_params)

        @targetgame.save!

        redirect_back fallback_location: "/players/#{targetgame_params['player_id']}"
    end

    def update
    end

    def destroy
        @targetgame = Targetgame.find_by(id: params[:targetgame][:id])
        @targetgame.destroy

        redirect_to user_path
    end

    protected
    def targetgame_params
        self.params.require(:targetgame).permit(:user_id, :contest_id)
    end
end
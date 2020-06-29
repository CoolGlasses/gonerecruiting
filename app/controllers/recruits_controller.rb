class RecruitsController < ApplicationController
    def create
        @recruit = Recruit.new(recruit_params)

        @recruit.save!

        redirect_to request.referer
    end

    protected
    def recruit_params
        self.params.require(:recruit).permit(:user_id, :player_id)
    end
end
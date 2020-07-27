class RecruitsController < ApplicationController
    def create
        @recruit = Recruit.new(recruit_params)

        @recruit.save!

        redirect_to user_url
    end

    def destroy
        @recruit = Recruit.find(params[:recruit][:user_id])
        @recruit = @recruit.find(params[:recruit][:player_id])
        debugger
        @recruit.destroy

        redirect_to user_path
    end

    protected
    def recruit_params
        self.params.require(:recruit).permit(:user_id, :player_id)
    end
end
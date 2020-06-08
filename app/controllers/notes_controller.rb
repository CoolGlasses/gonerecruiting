class NotesController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    def create
        @note = Note.new(note_params)

        @note.save!
        redirect_back fallback_location: "/players/#{note_params['player_id']}"
    end

    protected
    def note_params
        self.params.require(:note).permit(:user_id, :player_id, :note)
    end
end
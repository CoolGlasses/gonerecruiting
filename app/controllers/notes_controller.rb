class NotesController < ApplicationCcontroller
    def create
        @note = Note.new(note_params)

        @note.save!
    end

    protected
    def note_params
        self.params.require(:note).permit(:user_id, :player_id, :note)
    end
end
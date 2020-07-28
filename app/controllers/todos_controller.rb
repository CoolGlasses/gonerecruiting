class TodosController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    def create
        @todo = Todo.new(todo_params)

        @todo.save!
        redirect_to users_path
    end

    protected
    def todo_params
        self.params.require(:todo).permit(:user_id, :player_id, :contest_id, :due_by, :duration)
    end
end
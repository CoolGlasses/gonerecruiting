class TodosController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    def create
        @todo = Todo.new(todo_params)

        @todo.save!
        redirect_back fallback_location: "/users/#{todo_params['user_id']}"
    end

    protected
    def todo_params
        self.params.require(:todo).permit(:user_id, :player_id, :contest_id, :due_by, :duration, :description)
    end
end
class TodosController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    def create
        if todo_params[:due_by][-2..-1] == "PM"
            am_pm = 12
        else
            am_pm = 0
        end

        if todo_params[:due_by].length == 18
            time = DateTime.new(todo_params[:due_by][6..9].to_i, todo_params[:due_by][0..1].to_i, todo_params[:due_by][3..4].to_i, todo_params[:due_by][11].to_i + am_pm, todo_params[:due_by][13..14].to_i)
        else
            time = DateTime.new(todo_params[:due_by][6..9].to_i, todo_params[:due_by][0..1].to_i, todo_params[:due_by][3..4].to_i, todo_params[:due_by][11..12].to_i + am_pm, todo_params[:due_by][14..15].to_i)
        end

        @todo = Todo.create!(
            user_id: "#{todo_params[:user_id]}",
            player_id: "#{todo_params[:player_id]}",
            contest_id: "#{todo_params[:contest_id]}",
            due_by: "#{time}",
            duration: "#{todo_params[:duration]}",
            description: "#{todo_params[:description]}"
        )

        redirect_back fallback_location: "/users/#{todo_params['user_id']}"
    end

    protected
    def todo_params
        self.params.require(:todo).permit(:user_id, :player_id, :contest_id, :due_by, :duration, :description)
    end
end
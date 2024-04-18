class GoalsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
    before_action :set_goal, only: [:show, :edit, :update, :destroy]

    def index
        @goals = current_user.goals
    end
  
    def new
      @goal = Goal.new
      3.times { @goal.goal_exercises.build.build_exercise }
    end
  
    def create
        @goal = current_user.goals.new(goal_params)
        if @goal.save
            redirect_to @goal, notice: 'Goal was successfully created.'
        else
            render :new
        end
    end

    def update
        if @goal.update(goal_params)
            redirect_to @goal, notice: 'Goal was successfully updated.'
        else
            render :edit
        end
    end

    private
  
    def set_goal
        @goal = current_user.goals.find(params[:id])
    end
  
    def goal_params
        params.require(:goal).permit(:description, :start_date, :end_date, :status,
                                     goal_exercises_attributes: [:id, :exercise_id, :target_weight, :repetitions, :_destroy])
    end
end
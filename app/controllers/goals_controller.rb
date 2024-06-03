class GoalsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
    before_action :set_goal, only: [:show, :edit, :update, :destroy]

    def index
        @goals = current_user.goals
    end
  
    def new
        @goal = Goal.new
        @goal.goal_exercises.build.build_exercise
    end
  
    def create
        @goal = Goal.new(goal_params)
        logger.debug "Params: #{params.inspect}"
        logger.debug "Goal Params: #{goal_params.inspect}"
        if @goal.save
          redirect_to @goal, notice: 'Goal was successfully created.'
        else
          render :new
        end
    end

    def show
        # Logic to show a single goal
    end

    def edit
        # Logic to edit an existing goal
    end

    def update
        if @goal.update(goal_params)
            redirect_to @goal, notice: 'Goal was successfully updated.'
        else
            render :edit
        end
    end

    def destroy
        @goal.destroy
        redirect_to goals_path, notice: 'Goal was successfully destroyed.'
    end

    private

    def set_goal
        @goal = Goal.find(params[:id])
    end

    def goal_params
        params.require(:goal).permit(:start_date, :end_date, goal_exercises_attributes: [:id, :name, :target_weight, :repetitions])
    end
end
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
        @goal = current_user.goals.build(goal_params)
        if @goal.save
          redirect_to @goal, notice: I18n.t('goals.created_successfully')
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
        @goal = Goal.find(params[:id])
        if @goal.update(goal_params)
          redirect_to @goal, notice: t('goals.updated_successfully')
        else
          render :edit
        end
    end

    def destroy
        @goal = Goal.find(params[:id])
        if @goal.destroy
          redirect_to goals_path, notice: I18n.t('goals.destroy_success')
        else
          redirect_to goals_path, alert: '目標の削除に失敗しました。'
        end
    end
      

    private

    def set_goal
        @goal = Goal.find(params[:id])
    end

    def goal_params
        params.require(:goal).permit(:start_date, :end_date, goal_exercises_attributes: [:id, :exercise_id, :target_weight, :repetitions, :_destroy])
      end
end
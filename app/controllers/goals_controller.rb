class GoalsController < ApplicationController
    before_action :authenticate_user!  # ユーザーがログインしているか確認
    before_action :set_goal, only: [:edit, :update]
  
    def new
      @goal = Goal.new
    end
  
    def edit
    end
  
    def create
      @goal = current_user.goals.build(goal_params)
      if @goal.save
        redirect_to dashboard_path, notice: '目標が正常に作成されました。'
      else
        render :new
      end
    end
  
    def update
      if @goal.update(goal_params)
        redirect_to dashboard_path, notice: '目標が正常に更新されました。'
      else
        render :edit
      end
    end
  
    private
  
    def set_goal
      @goal = current_user.goals.find_by(id: params[:id])
      redirect_to dashboard_path, alert: '指定された目標が見つかりません。' if @goal.nil?
    end
  
    def goal_params
      params.require(:goal).permit(:target_value, :description)
    end
  end
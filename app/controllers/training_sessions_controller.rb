class TrainingSessionsController < ApplicationController
    before_action :set_training_session, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, only: [:create, :update, :delete] 
  
    def index
      @training_sessions = TrainingSession.all
    end
  
    def show
      @training_session = TrainingSession.includes(:session_exercises).find(params[:id])
    end
  
    def new
      @training_session = TrainingSession.new
      @training_session.session_exercises.build
    end
  
    def create
      puts "Current user: #{current_user.inspect}"  # 現在のユーザー情報をログに出力
      @training_session = current_user.training_sessions.new(training_session_params)
    
      if @training_session.save
        redirect_to @training_session, notice: 'トレーニングセッションが正常に作成されました。'
      else
        puts @training_session.errors.full_messages  # 保存に失敗した場合のエラーメッセージをログに出力
        flash.now[:alert] = @training_session.errors.full_messages
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @training_session.update(training_session_params)
        redirect_to @training_session, notice: 'トレーニングセッションが正常に更新されました。'
      else
        puts @training_session.errors.full_messages  # 更新に失敗した場合のエラーメッセージをログに出力
        flash.now[:alert] = @training_session.errors.full_messages
        render :edit
      end
    end
  
    def destroy
      @training_session.destroy
      redirect_to training_sessions_url, notice: 'Training session was successfully destroyed.'
    end
  
    private
  
    def set_training_session
        @training_session = TrainingSession.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        redirect_to training_sessions_path, alert: "Training session not found."
    end
  
    def training_session_params
      params.require(:training_session).permit(:date, session_exercises_attributes: [:id, :name, :weight, :reps, :_destroy])
    end

    def sessions_on_date
      @date = params[:date]
      @sessions = TrainingSession.where(date: @date)
      unless @sessions.exists?
        redirect_to training_sessions_path, alert: "No sessions found on this date."
      end
    end
  end
class TrainingSessionsController < ApplicationController
    before_action :set_training_session, only: [:show, :edit, :update, :destroy]
  
    def index
      @training_sessions = TrainingSession.all
    end
  
    def show
      @training_session = TrainingSession.includes(session_exercises: :exercise).find(params[:id])
    end
  
    def new
      @training_session = TrainingSession.new
      @training_session.session_exercises.build
    end
  
    def create
      @training_session = TrainingSession.new(training_session_params)
      if @training_session.save
        redirect_to sessions_on_date_training_sessions_path(date: @training_session.date), notice: 'Training session was successfully created.'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @training_session.update(training_session_params)
        redirect_to @training_session, notice: 'Training session was successfully updated.'
      else
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
      params.require(:training_session).permit(:date, session_exercises_attributes: [:name, :weight, :reps])
    end

    def sessions_on_date
      @date = params[:date]
      @sessions = TrainingSession.where(date: @date)
      unless @sessions.exists?
        redirect_to training_sessions_path, alert: "No sessions found on this date."
      end
    end
  end
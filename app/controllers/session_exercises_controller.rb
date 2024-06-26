class SessionExercisesController < ApplicationController
    before_action :set_session_exercise, only: [:show, :edit, :update, :destroy]
  
    def index
      @session_exercises = SessionExercise.all
    end
  
    def show
    end
  
    def new
      @session_exercise = SessionExercise.new
      @exercises = Exercise.all
    end
  
    def create
      @session_exercise = SessionExercise.new(session_exercise_params)
      if @session_exercise.save
        redirect_to @session_exercise, notice: 'Session exercise was successfully created.'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @session_exercise.update(session_exercise_params)
        redirect_to @session_exercise, notice: 'Session exercise was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @session_exercise.destroy
      redirect_to session_exercises_url, notice: 'Session exercise was successfully destroyed.'
    end
  
    private
  
    def set_session_exercise
      @session_exercise = SessionExercise.find(params[:id])
    end
  
    def session_exercise_params
      params.require(:session_exercise).permit(:session_id, :exercise_id, :weight, :sets, :reps)
    end
  end
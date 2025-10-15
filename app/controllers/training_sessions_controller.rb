# frozen_string_literal: true

class TrainingSessionsController < ApplicationController
  before_action :set_training_session, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: %i[create update destroy]

  def index
    @training_sessions = TrainingSession.all
  end

  def show; end

  def new
    @training_session = TrainingSession.new(date: Date.today)
    @training_session.session_exercises.build if @training_session.session_exercises.empty?
    @exercises = Exercise.order(:name).to_a
  end

  def create
    @training_session = current_user.training_sessions.new(training_session_params)

    if @training_session.save
      check_goals(@training_session)
      redirect_to @training_session, notice: 'トレーニングセッションが正常に作成されました。'
    else
      puts @training_session.errors.full_messages
      flash.now[:alert] = @training_session.errors.full_messages
      render :new
    end
  end

  def edit; end

  def update
    if @training_session.update(training_session_params)
      redirect_to @training_session, notice: 'トレーニングセッションが正常に更新されました。'
    else
      puts @training_session.errors.full_messages
      flash.now[:alert] = @training_session.errors.full_messages
      render :edit, status: :unprocessable_entity
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
    redirect_to training_sessions_path, alert: 'Training session not found.'
  end

  def training_session_params
    params.require(:training_session).permit(
      :date,
      session_exercises_attributes: %i[id exercise_id name weight reps _destroy]
    )
  end

  def sessions_on_date
    @date = params[:date]
    @sessions = TrainingSession.where(date: @date)
    return if @sessions.exists?

    redirect_to training_sessions_path, alert: 'No sessions found on this date.'
  end

  def check_goals(session)
    session.session_exercises.each do |exercise|
      current_user.goals.each do |goal|
        goal.goal_exercises.each do |goal_exercise|
          next unless exercise.respond_to?(:exercise_id) && goal_exercise.exercise_id.present? &&
                      exercise.exercise_id == goal_exercise.exercise_id &&
                      exercise.weight.to_d >= goal_exercise.target_weight.to_d
          # goal_exercise.update(achieved: true) は schema に無いので実行しない
        end
        goal.update_achievement
      end
    end
  end

  def reward_user(goal)
    # 報酬のロジックをここに実装
    puts "Reward given for goal: #{goal.id}"
  end
end

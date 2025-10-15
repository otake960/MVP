class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @training_sessions = current_user.training_sessions
                                     .includes(:session_exercises)
                                     .order(created_at: :desc)
    @training_session  = current_user.training_sessions.build
  end
end

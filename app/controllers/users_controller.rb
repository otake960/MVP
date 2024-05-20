class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    p current_user
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
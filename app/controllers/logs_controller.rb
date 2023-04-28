class LogsController < ApplicationController
  def index
    @user = current_user
    @logs = policy_scope(Log).where(user: @user)
  end
end

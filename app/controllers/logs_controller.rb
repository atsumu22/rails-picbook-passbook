class LogsController < ApplicationController
  before_action :set_book, only: %i[new create]

  def index
    @user = current_user
    @logs = policy_scope(Log).where(user: @user)
  end

  def new
    @log = Log.new
    authorize @log
  end

  def create
    @log = Log.new
    @log.book = @book
    @log.user = current_user
    @user = current_user
    @logs = policy_scope(Log).where(user: @user)
    @duplicated_checker = @logs.map do |log|
      log.book == @book
    end
    authorize @log
    if @duplicated_checker.none?(true)
      @log.save
      redirect_to logs_path
    end
  end

  private

  def set_book
    @book = Book.find(params[:book_id])
  end
end

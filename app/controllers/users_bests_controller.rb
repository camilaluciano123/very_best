class UsersBestsController < ApplicationController
  before_action :set_users_best, only: %i[show edit update destroy]

  def index
    @q = UsersBest.ransack(params[:q])
    @users_bests = @q.result(distinct: true).includes(:user, :dishes,
                                                      :venue).page(params[:page]).per(10)
  end

  def show; end

  def new
    @users_best = UsersBest.new
  end

  def edit; end

  def create
    @users_best = UsersBest.new(users_best_params)

    if @users_best.save
      message = "UsersBest was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @users_best, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @users_best.update(users_best_params)
      redirect_to @users_best, notice: "Users best was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @users_best.destroy
    message = "UsersBest was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to users_bests_url, notice: message
    end
  end

  private

  def set_users_best
    @users_best = UsersBest.find(params[:id])
  end

  def users_best_params
    params.require(:users_best).permit(:dishes_id, :venue_id, :user_id)
  end
end

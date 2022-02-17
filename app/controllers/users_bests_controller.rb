class UsersBestsController < ApplicationController
  before_action :set_users_best, only: [:show, :edit, :update, :destroy]

  # GET /users_bests
  def index
    @q = UsersBest.ransack(params[:q])
    @users_bests = @q.result(:distinct => true).includes(:user, :dishes, :venue).page(params[:page]).per(10)
  end

  # GET /users_bests/1
  def show
  end

  # GET /users_bests/new
  def new
    @users_best = UsersBest.new
  end

  # GET /users_bests/1/edit
  def edit
  end

  # POST /users_bests
  def create
    @users_best = UsersBest.new(users_best_params)

    if @users_best.save
      message = 'UsersBest was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @users_best, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /users_bests/1
  def update
    if @users_best.update(users_best_params)
      redirect_to @users_best, notice: 'Users best was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /users_bests/1
  def destroy
    @users_best.destroy
    message = "UsersBest was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to users_bests_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_users_best
      @users_best = UsersBest.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def users_best_params
      params.require(:users_best).permit(:dishes_id, :venue_id, :user_id)
    end
end

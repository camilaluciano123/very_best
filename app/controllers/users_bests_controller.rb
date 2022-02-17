class UsersBestsController < ApplicationController
  before_action :set_users_best, only: [:show, :edit, :update, :destroy]

  # GET /users_bests
  def index
    @users_bests = UsersBest.all
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
      redirect_to @users_best, notice: 'Users best was successfully created.'
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
    redirect_to users_bests_url, notice: 'Users best was successfully destroyed.'
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

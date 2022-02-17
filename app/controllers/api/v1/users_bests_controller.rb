class Api::V1::UsersBestsController < Api::V1::GraphitiController
  def index
    users_bests = UsersBestResource.all(params)
    respond_with(users_bests)
  end

  def show
    users_best = UsersBestResource.find(params)
    respond_with(users_best)
  end

  def create
    users_best = UsersBestResource.build(params)

    if users_best.save
      render jsonapi: users_best, status: 201
    else
      render jsonapi_errors: users_best
    end
  end

  def update
    users_best = UsersBestResource.find(params)

    if users_best.update_attributes
      render jsonapi: users_best
    else
      render jsonapi_errors: users_best
    end
  end

  def destroy
    users_best = UsersBestResource.find(params)

    if users_best.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: users_best
    end
  end
end

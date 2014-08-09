class UsersController < Clearance::UsersController
  def edit
  end

  def update
    foods = Food.find(params[:user][:food_ids].reject { |id| id.blank? })
    foods.each { |food| current_user.foods << food }

    current_user.create_active_meals(params[:user][:meals_per_day].to_i)
    redirect_to new_device_path
  end

  private

  def url_after_create
    new_food_path
  end
end

class UsersActivitiesController < ApplicationController
  before_action :authenticate_user!

  def create
    completed_activity_ids = params[:activity_ids] || []

    user_id = current_user.id

    UserActivity.where(user_id: user_id).destroy_all

    completed_activity_ids.each do |activity_id|
      UserActivity.create!(user_id: user_id, activity_id: activity_id)
    end

    redirect_to activities_path
  end
end

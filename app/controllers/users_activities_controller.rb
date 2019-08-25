class UsersActivitiesController < ApplicationController
  before_action :authenticate_user!

  def create
    Rails.logger.info("params #{params}")

    completed_activity_ids = params[:activity_ids]

    Rails.logger.info("completed_activity_ids #{completed_activity_ids}")

    user_id = current_user.id
    completed_activity_ids.each do |activity_id|
      UserActivity.create!(user_id: user_id, activity_id: activity_id)
    end

    redirect_to activities_path
  end
end

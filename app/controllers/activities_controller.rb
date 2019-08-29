class ActivitiesController < ApplicationController
  before_action :authenticate_user!

  def index
    @activities_by_type = Activity.all.group_by do |activity|
      activity.activity_type_id
    end
    @activities_by_type = Hash.new { |h, k| h[k] = [] }.merge(@activities_by_type)

    render :index
  end
end

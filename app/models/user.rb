class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_activities

  def completed?(activity)
    user_activity = user_activities.where(activity: activity).order(created_at: :desc).first
    if user_activity
      true
    else
      false
    end
  end
end

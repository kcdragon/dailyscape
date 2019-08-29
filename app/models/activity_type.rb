class ActivityType < ApplicationRecord
  validates_presence_of :name

  def self.daily
    ActivityType.find(1)
  end

  def self.weekly
    ActivityType.find(2)
  end

  def self.monthly
    ActivityType.find(3)
  end
end

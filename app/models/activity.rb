class Activity < ApplicationRecord
  belongs_to :activity_type

  validates_presence_of :name, :activity_type
end

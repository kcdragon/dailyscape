# Create Fake User
user = User.create!(email: 'test@example.com', password: 'password')

# Create Activity Types
daily = ActivityType.create!({ name: 'daily' })
weekly = ActivityType.create!({ name: 'weekly' })
monthly = ActivityType.create!({ name: 'monthly' })

# Create Activities
[
  { name: 'Sinkholes', activity_type: daily },
  { name: 'Guthixian Cache', activity_type: daily },
  { name: 'Reaper Task', activity_type: daily },
  { name: 'Tears of Guthix', activity_type: weekly },
  { name: 'Skeletal Horror', activity_type: weekly },
  { name: 'Helping Meg', activity_type: weekly },
  { name: 'Herby Werby', activity_type: weekly },
  { name: 'God Statues', activity_type: monthly },
  { name: 'Giant Oyster', activity_type: monthly },
  { name: 'Troll Invasion', activity_type: monthly }
].each do |activity|
  Activity.create!(activity)
end

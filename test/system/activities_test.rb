require 'application_system_test_case'

class ActivitiesTest < ApplicationSystemTestCase
  test 'checking and unchecking a daily activity' do
    create_user
    sinkholes = Activity.create!(name: 'Sinkholes', activity_type: ActivityType.daily)

    log_in
  
    assert_selector 'li', text: 'Sinkholes'
    assert page.has_no_checked_field?("activity_ids_#{sinkholes.id}")
    check 'Sinkholes'
    click_button 'Save changes'

    visit activities_url
    assert page.has_checked_field?("activity_ids_#{sinkholes.id}")
    uncheck 'Sinkholes'
    click_button 'Save changes'

    visit activities_url
    assert page.has_no_checked_field?("activity_ids_#{sinkholes.id}")
  end

  test 'checking and unchecking a weekly activity' do
    create_user
    tears_of_guthix = Activity.create!(name: 'Tears of Guthix', activity_type: ActivityType.weekly)

    log_in
  
    assert_selector 'li', text: 'Tears of Guthix'
    assert page.has_no_checked_field?("activity_ids_#{tears_of_guthix.id}")
    check 'Tears of Guthix'
    click_button 'Save changes'

    visit activities_url
    assert page.has_checked_field?("activity_ids_#{tears_of_guthix.id}")
    uncheck 'Tears of Guthix'
    click_button 'Save changes'

    visit activities_url
    assert page.has_no_checked_field?("activity_ids_#{tears_of_guthix.id}")
  end

  test 'checking and unchecking a monthly activity' do
    create_user
    giant_oyster = Activity.create!(name: 'Giant Oyster', activity_type: ActivityType.monthly)

    log_in
  
    assert_selector 'li', text: 'Giant Oyster'
    assert page.has_no_checked_field?("activity_ids_#{giant_oyster.id}")
    check 'Giant Oyster'
    click_button 'Save changes'

    visit activities_url
    assert page.has_checked_field?("activity_ids_#{giant_oyster.id}")
    uncheck 'Giant Oyster'
    click_button 'Save changes'

    visit activities_url
    assert page.has_no_checked_field?("activity_ids_#{giant_oyster.id}")
  end

  test 'next day after completing a task' do
  end

  def create_user
    if !User.where(email: 'test@example.com').exists?
      User.create!(email: 'test@example.com', password: 'password')
    end
  end

  def log_in
    visit activities_url
    fill_in 'user[email]', with: 'test@example.com'
    fill_in 'user[password]', with: 'password'
    click_button 'Log in'
  end
end

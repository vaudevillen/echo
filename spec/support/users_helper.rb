module UserHelper
  def register(username, password)
    click_button("Register")
    fill_in 'user_first_name', with: Faker::Name.first_name
    fill_in 'user_last_name', with: Faker::Name.last_name
    fill_in 'user_email', with: Faker::Internet.email
    fill_in 'user_username', with: username
    fill_in 'user_password', with: password
    fill_in 'user_city', with: "Chicago"
    execute_script('a=1')
    select 'option[value=14]', from: 'user_state'
    find('input[type=submit]').click
  end
  def login(username, password)
    fill_in 'username', with: username
    fill_in 'password', with: password
    all(:button, "Login").last.click
  end
end

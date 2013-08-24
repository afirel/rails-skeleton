
def login_as(user, password)
  within(:xpath, "//div/form[@id='new_user']") do
    fill_in 'user_email', :with => user
    fill_in 'user_password', :with => password
    click_button('Sign in')
  end
end

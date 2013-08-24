
def login_as(user, password)
  visit '/'
  within(:xpath, "//div/form[@id='login']") do
    fill_in 'user_email', :with => user
    fill_in 'user_password', :with => password
    click_button('Sign in')
  end
end

require 'spec_helper'

describe 'the login and signup process' do

  let(:email) { 'test@user.de' }
  let(:password) { 'password' }

  subject { visit '/users/sign_in' }

  it 'provides link to signup' do
    subject
    expect(page).to have_link('Sign up')
  end

  it 'provides link to reset password' do
    subject
    expect(page).to have_link('Forgot your password')
  end

  it 'provides link to resend confirmation instruction' do
    subject
    expect(page).to have_link('receive confirmation instructions')
  end

  context 'logging in' do
    it 'rejects invalid credentials' do
      subject
      login_as email, password
      expect(page).to have_content('Invalid email or password')
    end
    it 'accepts valid credentials and shows logout button' do
      User.create_user!(email: email, password: password, confirmed: true)
      subject
      login_as email, password
      expect(page).to have_button('Logout')
    end
  end

  context 'logging out' do
    it 'destroys the session when clicking logout' do
      subject
      User.create_user!(email: email, password: password, confirmed: true)
      login_as email, password
      click_button('Logout')
      expect(current_path).to eq(root_path)
    end
  end

end

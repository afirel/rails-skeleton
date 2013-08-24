require 'spec_helper'

describe User do

  context '.create_user!' do
    let(:email) { double('email') }
    let(:password) { double('passsword') }

    it 'should create a valid but not confirmed user' do
      User.should_receive(:create!).with(email: email, password: password, password_confirmation: password, confirmed_at: nil)
      User.create_user!(email: email, password: password)
    end

    it 'should create a valid and confirmed user' do
      User.should_receive(:create!).with(email: email, password: password, password_confirmation: password, confirmed_at: DateTime.now)
      User.create_user!(email: email, password: password, confirmed: true)
    end
  end
end

require 'spec_helper'

describe 'wecome page', type: :feature do

  it 'contains a default headline' do
    visit '/'
    expect(page).to have_content('Bootstrap starter template')
  end

end

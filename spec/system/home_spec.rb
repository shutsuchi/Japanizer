require 'rails_helper'

describe 'Home', type: :system do
  before do
    driven_by :selenium_chrome_headless
  end

  it 'shows toppage' do
    visit top_url
    expect(current_page).to eq(top_path)
  end
end

require 'rails_helper'

RSpec.describe 'Searches', type: :request do
  describe 'GET /searches' do
    before do
      get search_path
    end

    it 'returns a 200 response' do
      expect(response).to have_http_status(200)
    end
    it 'contains a specific word' do
      expect(response.body).to include(I18n.t('searches.title'))
    end
  end
end

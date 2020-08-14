require 'rails_helper'

RSpec.describe 'Albums', type: :request do
  describe 'GET /albums' do
    it 'returns a 200 response' do
    end
    it 'contains a specific word' do
    end
  end

  describe 'GET /albums/:id' do
    it 'returns a 200 response' do
    end
    it 'contains a specific word' do
    end
  end

  describe 'GET /albums/:id/edit' do
    context 'as an authorized user' do
      it 'returns a 200 response' do
      end
      it 'contains a specific word' do
      end
    end
    context 'as a guest user' do
      it 'returns a response 302' do
      end
      it 'redirects the page to /top' do
      end
    end
  end

  describe 'POST /albums' do
    context 'as an authorized user' do
      context 'with valid attributes' do
        it 'creates a album record' do
        end
        it 'redirects the page to /albums/:id' do
        end
      end
      context 'with invalid attributes' do
        it 'failed to request' do
        end
        it 'render the page of /albums' do
        end
      end
    end
    context 'as a guest user' do
      it 'returns a 302 response' do
      end
      it 'redirect the page to /top' do
      end
    end
  end

  describe 'PATCH /albums/:id' do
    context 'as an authorized user' do
      context 'as a user who created' do
        context 'with valid attributes' do
          it 'returns a 200 response' do
          end
          it 'updates a album record' do
          end
          it 'redirects the page to /albums/:id' do
          end
        end
        context 'with invalid attributes' do
          it 'returns a 302 response' do
          end
          it 'render the page /albums/:id' do
          end
        end
      end
      context 'as a user who did not create' do
        it 'returns a 302 respose' do
        end
        it 'redirect the page to /users/:id' do
        end
      end
    end
    context 'as a guest user' do
      it 'returns a 302 response' do
      end
      it 'redirect the page to /top' do
      end
    end
  end

  describe 'DELETE /albums/:id' do
    context 'as an authorized user' do
      context 'as a user who created' do
        it 'deletes a album' do
        end
        it 'redirect the page to /user/:id' do
        end
      end
    end
    context 'as a guest user' do
      it 'returns a 302 response' do
      end
      it 'redirect the page to /top' do
      end
    end
  end
end

require 'rails_helper'

RSpec.describe 'Events', type: :request do
  describe 'GET /events' do
    it 'succeeds response' do
    end
    it 'contains a specific word' do
    end
  end

  describe 'GET /events/:id' do
    it 'returns a 200 response' do
    end
    it 'contains a specific word' do
    end
  end

  describe 'POST /events' do
    context 'as an authorized user' do
      context 'with valid attributes' do
        it 'creates a event record' do
        end
        it 'redirects the page to /users/:id' do
        end
      end
      context 'with invalid attributes' do
        it 'failed to request' do
        end
        it 'render the page of /users/:id' do
        end
      end
    end
    context 'as a guest user' do
      it 'returns a 302 response' do
      end
      it 'redirect the page to /users/sign_in' do
      end
    end
  end

  describe 'PATCH /events/:id' do
    context 'as an authorized user' do
      context 'as a user who created' do
        context 'with valid attributes' do
          it 'returns a 200 response' do
          end
          it 'updates a event record' do
          end
          it 'redirects the page to /events/:id' do
          end
        end
        context 'with invalid attributes' do
          it 'returns a 302 response' do
          end
          it 'render the page /events/:id' do
          end
        end
      end
    end
    context 'as a guest user' do
      it 'returns a 302 response' do
      end
      it 'redirect the page to /sign_in' do
      end
    end
  end

  describe 'DELETE /events/:id' do
    context 'as an authorized user' do
      context 'as a user who created' do
        it 'deletes a album' do
        end
        it 'redirect the page to /user/:id' do
        end
      end
    end
    context 'as a guest user' do
      context 'as a user who created' do
        it 'returns a 302 response' do
        end
        it 'redirect the page to /users/sign_in' do
        end
      end
    end
  end
end

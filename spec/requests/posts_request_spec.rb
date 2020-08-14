require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /posts' do
    it 'returns a 200 response' do
    end
    it 'contains a specific word' do
    end
  end

  describe 'GET posts/:id' do
    it 'returns a 200 response' do
    end
    it 'contains a specific word' do
    end
  end

  describe 'GET posts/:id/edit' do
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

  describe 'POST posts/' do
    context 'as an authorized user' do
      context 'with valid attributes' do

        it 'creates a post record' do
        end
        it 'redirects the page to /posts/:id' do
        end
      end

      context 'with invalid attributes' do
        it 'failed to request' do
        end
        it 'render the page of /posts' do
        end
      end
    end

    context 'as a guest user' do
    end
  end

  describe 'PATCH posts/:id' do
    context 'as an authorized user' do
      context 'as a user who posted' do
        context 'with valid attributes' do

          it 'returns a 200 response' do
          end
          it "updates a post record" do
          end
          it 'redirects the page to /post/:id' do
          end
        end

        context 'with invalid attributes' do
        end
      end
    end

    context 'as a guest user' do
      it '' do
      end
      it '' do
      end
    end
  end

  describe 'DELETE posts/:id' do
    context 'as an authorized user' do
      context 'as a user who posted' do
        it 'deletes a post' do
        end
        it 'redirect the page to /user/:id' do
        end
      end

      context 'as a user who did not post' do
        it 'does not delete a post' do
        end
        it 'redirect the page to /users/sign_in' do
        end
      end
    end

    context 'as a guest user' do
      context 'as an user who did not posted' do
        it 'does not delete a post' do
        end
        it 'redirect the page to /top' do
        end
      end
    end
  end
end

require 'rails_helper'

RSpec.describe 'PostComments', type: :request do
  describe 'POST /posts/:post_id/post_comments' do
    context 'as an authorized user' do
      it 'creates a post_comment' do
      end
    end
    context 'as an guest user' do
      it 'returns a 302 response' do
      end
      it 'redirects the page to /users/sign_in' do
      end
    end
  end

  describe 'PATCH /posts/:post_id/post_comments' do
    context 'as an authorized user' do
      context 'as a user who created' do
        context 'with valid attributes' do
          it 'returns a 200 response' do
          end
          it 'updates a post_comment record' do
          end
          it 'renders the page to /posts/:id' do
          end
        end
        context 'with invalid attributes' do
          it 'returns a 302 response' do
          end
          it 'renders the page /posts/:id' do
          end
        end
      end
    end
    context 'as a guest user' do
      it 'returns a 302 response' do
      end
      it 'redirects the page to /sign_in' do
      end
    end
  end

  describe 'DELETE /posts/:post_id/post_comments' do
    context 'as an authorized user' do
      it 'deletes a post_comment' do
      end
      it 'render the page /posts/:id' do
      end
    end
    context 'as an guest user' do
      it 'does not delete post_comment' do
      end
      it 'redirect the page /users/sign_in' do
      end
    end
  end
end

require 'rails_helper'

RSpec.describe 'POSTCOMMENTS-TEST', type: :request do
  describe '# POST /posts/:post_id/post_comments' do
    context 'as an authorized user' do
      before do
        sign_in user
      end
      let(:user){ create(:user) }
      let(:post_param){ create(:post) }
      let(:comment_params){ attributes_for(:postComment, user: user) }
      it 'creates a post_comment' do
        expect do
          post post_post_comments_path(post_id: post_param.id), params: { post_comment: comment_params }, xhr: true
        end.to change(user.post_comments, :count).by(1)
      end
    end
  end

  #describe 'PATCH /posts/:post_id/post_comments' do
  #  context 'as an authorized user' do
  #    context 'as a user who created' do
  #      context 'with valid attributes' do
  #        it 'returns a 200 response' do
  #        end
  #        it 'updates a post_comment record' do
  #        end
  #        it 'renders the page to /posts/:id' do
  #        end
  #      end
  #      context 'with invalid attributes' do
  #        it 'returns a 302 response' do
  #        end
  #        it 'renders the page /posts/:id' do
  #        end
  #      end
  #    end
  #  end
  #  context 'as a guest user' do
  #    it 'returns a 302 response' do
  #    end
  #    it 'redirects the page to /sign_in' do
  #    end
  #  end
  #end

  describe '# DELETE /posts/:post_id/post_comments' do
    context 'as an authorized user' do
      before do
        sign_in user
      end
      let(:user){ create(:user) }
      let(:post){ create(:post) }
      let(:comment){ create(:postComment) }

      it 'deletes a post_comment' do
        expect do
          delete  post_post_comments_path(id: comment, post_id: post), xhr: true
        end.to change(user.post_comments, :count).by(0)
      end
    end
  end
end

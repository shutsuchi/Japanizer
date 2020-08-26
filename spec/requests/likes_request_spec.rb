require 'rails_helper'

RSpec.describe 'LIKES-TEST', type: :request do
  describe '# POST /posts/:post_id/likes' do
    context 'as an authorized user' do
      context 'as a user who created' do
        before do
          sign_in user
        end
        let(:user){ create(:user) }
        let(:post_param){ create(:post) }
        let(:like_params){ create(:like) }
        it 'creates a like record' do
          expect do
            post post_likes_path(post_id: post_param.id), params: { like: like_params }, xhr: true
          end.to change(user.likes, :count).by(1)
        end
      end
    end
  end

  describe '# DELETE /posts/:post_id/likes' do
    context 'as an authorized user' do
      context 'as a user who created' do
        before do
          sign_in user
          post post_likes_path(post_id: post_param.id), params: {like: like_params }, xhr: true
        end
        let(:user){ create(:user) }
        let(:post_param){ create(:post) }
        let(:like){ create(:like) }
        let(:like_params){ attributes_for(:like) }
        it 'deletes a album' do
          expect do
            delete post_likes_path(post_id: post_param.id), xhr: true
          end.to change(user.likes, :count).by(-1)
        end
      end
    end
  end
end

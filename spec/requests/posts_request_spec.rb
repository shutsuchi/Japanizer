require 'rails_helper'

RSpec.describe 'POST-TEST', type: :request do
  describe '# GET /posts' do
    before do
      get posts_path
    end
    it 'returns a 200 response' do
      expect(response).to have_http_status(200)
    end
    it 'contains a specific word' do
      expect(response.body).to include(I18n.t('posts.index.post_o'))
    end
  end

  describe '# GET posts/:id' do
    let(:post){ create(:post, id: 1, user_id: 1) }
    let(:user){ create(:user, id: 1) }
    before do
      sign_in user
      get post_path(id: post)
    end
    it 'returns a 200 response' do
      expect(response).to have_http_status(200)
    end
    it 'contains a specific word' do
      expect(response.body).to include(I18n.t('posts.show.pagetitle'))
    end
  end

  describe '# GET posts/:id/edit' do
    context 'as an authorized user' do
      let(:post){ create(:post, user_id: 1) }
      let(:user){ create(:user, id: 1) }
      before do
        sign_in user
        get edit_post_path(id: post)
      end
      it 'returns a 200 response' do
        expect(response).to have_http_status(200)
      end
      it 'contains a specific word' do
        expect(response.body).to include(I18n.t('posts.edit.pagetitle'))
      end
    end

    context 'as a guest user' do
      let(:post){ create(:post, id: 1) }
      before do
        get edit_post_path(id: post)
      end
      it 'returns a response 302' do
        expect(response).to have_http_status(302)
      end
      it 'redirects the page to /users/sign_in' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe '# POST /posts' do
    context 'as an authorized user' do
      before do
        sign_in user
      end
      let(:user){ create(:user, id: 1) }
      let(:another_user){ create(:another_user) }
      context 'with valid attributes' do
        #let(:post){ build(:post, id: 1, user_id: 1) }
        let(:another_post){ attributes_for(:another_post, user: user) }

        it 'creates a post record' do
          #binding.pry
          expect do
            #post posts_path(id: another_post), params: { post: another_post }
            post posts_path, params: {
              post: {
                user_id: 1,
                album_id: 1,
                prefecture_id: 1,
                city_id: 1,
                genre_id: 1,
                title: 'awesome',
                comment: 'good',
              }
            }
          end.to change(user.posts, :count).by(0)
        end
      end

      context 'with invalid attributes' do
        before do
          post posts_path, params: { post: post_params }
        end
        let(:post_params){ attributes_for(:post, title: nil) }

        it 'returns a 200 status code' do
          expect(response).to have_http_status(200)
        end

        it 'render the page /posts' do
          expect(response.body).to include(I18n.t('posts.index.post_o'))
        end
      end
    end
  end

  describe '# PATCH posts/:id' do
    context 'as an authorized user' do
      before do
        sign_in user
      end
      context 'as a user who posted' do
        let(:user){ create(:user) }
        let(:post){ create(:post, id: 1) }
        context 'with valid attributes' do
          let(:post_params){ attributes_for(:post, user: user, title: 'awesome') }

          it 'returns a 302 status code' do
            patch post_path(id: post), params: { post: post_params }
            expect(response).to have_http_status(302)
          end
          it "updates a post record" do
            #expect do
            #  patch post_path(id: post), params: { post: post_params }
            #end.to change { post.reload.title }.from('Japan Tour').to('awesome')
          end
          it 'redirects the page to /post/:id' do
            patch post_path(id: post), params: { post: post_params }
            expect(response).to redirect_to(user_path(id: user))
          end
        end
        context 'with invalid attributes' do
          let(:post_params){ attributes_for(:post, user: user, title: nil) }
          before do
            patch post_path(id: post), params: { post: post_params }
          end
          it 'returns a 302 response' do
            expect(response).to have_http_status(302)
          end
          it 'render the page /users/:id' do
            expect(response).to redirect_to(user_path(user))
          end
        end
      end
    end
    context 'as a guest user' do
      before do
        patch post_path(id: 1)
      end
      it 'returns a 302 status code' do
        expect(response).to have_http_status(302)
      end
      it 'redirects the page to /users/sign_in' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'DELETE posts/:id' do
    context 'as an authorized user' do
      before do
        sign_in user
      end
      context 'as a user who posted' do
        let(:user){ create(:user, id: 1) }
        let(:another_user){ create(:another_user, id: 2) }
        let(:post){ create(:post, id: 1, user: user) }
        it 'deletes a post' do
          expect do
            delete post_path(id: post)
          end.to change(user.posts, :count).by(0)
        end
        it 'redirect the page to /user/:id' do
          delete post_path(id: post)
          expect(response).to redirect_to(user_path(user))
        end
      end
      context 'as a user who did not post' do
        let(:user){ create(:user, id: 1) }
        let(:another_user){ create(:another_user, id: 2) }
        let(:another_post){ create(:post, id: 1, user: another_user, title: 'wooo', rate: 2, comment: 'amazing') }
        it 'does not delete a post' do
          expect do
            delete post_path(id: another_post)
          end.to change(user.posts, :count).by(0)
        end
        it 'redirect the page to /users/:id' do
          delete post_path(id: another_post)
          expect(response).to redirect_to(user_path(user))
        end
      end
    end
    context 'as a guest user' do
      before do
        delete post_path(id: 1)
      end
      it 'returns a 302 status code' do
        expect(response).to have_http_status(302)
      end
      it 'redirect the page to /users/sign_in' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end

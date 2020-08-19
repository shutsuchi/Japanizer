require 'rails_helper'

describe 'USER-AUTH-TEST' do
  let!(:user){ create(:user) }
  let!(:post){ create(:post, user: user) }
  let!(:album){ create(:album, user: user) }
  describe "# User doesn't log in" do
    context "Access URL related to user" do
      it 'cannot transit to show-page' do
        visit user_path(id: user)
        expect(current_path).to eq('/users/sign_in')
      end
      it 'cannot transit to edit-page' do
        visit edit_user_path(id: user)
        expect(current_path).to eq('/users/sign_in')
      end
      it 'cannot transit to withdraw-page' do
        visit withdraw_path(user_id: user)
        expect(current_path).to eq('/users/sign_in')
      end
    end
    context 'Access URL related to event' do
      it 'cannot transit to show-page' do
        visit event_path(id: 1)
        expect(current_path).to eq('/users/sign_in')
      end
    end
    context 'Access URL related to post' do
      it 'can transit to index-page' do
        visit posts_path
        expect(current_path).to eq('/posts')
      end
      it 'can transit to show-page' do
        visit post_path(id: post)
        expect(current_path).to eq('/posts/' + post.id.to_s)
      end
      it 'cannot transit to edit-page' do
        visit edit_post_path(id: post)
        expect(current_path).to eq('/users/sign_in')
      end
    end
    context "Access URL related to album" do
      it 'can transit to index-page' do
        visit albums_path
        expect(current_path).to eq('/albums')
      end
      it 'can transit to show-page' do
        visit album_path(id: album)
        expect(current_path).to eq('/albums/' + album.id.to_s)
      end
      it 'cannot transit to edit-page' do
        visit edit_album_path(id: album)
        expect(current_path).to eq('/users/sign_in')
      end
    end
    context "Access URL related to search" do
      it 'can transit to data-page' do
        visit data_path
        expect(current_path).to eq('/data')
      end
      it 'can transit to age-page' do
        visit age_path
        expect(current_path).to eq('/age')
      end
      it 'can transit to genre-page' do
        visit genres_path
        expect(current_path).to eq('/genres')
      end
      it 'can transit to budget-page' do
        visit budget_path
        expect(current_path).to eq('/budget')
      end
      it 'can transit to area-page' do
        visit prefectures_path
        expect(current_path).to eq('/prefectures')
      end
      it 'can transit to nation-page' do
        visit nation_path
        expect(current_path).to eq('/nation')
      end
      it 'can transit to search-page' do
        visit search_path
        expect(current_path).to eq('/searches')
      end
    end
  end
end

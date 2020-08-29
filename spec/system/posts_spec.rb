require 'rails_helper'

describe 'POST-TEST', type: :system do
  let(:user) { create(:user) }
  let!(:user2) { create(:another_user) }
  let!(:post) { create(:post, user: user, album: album) }
  let!(:post2) { create(:another_post, user: user2) }
  let!(:album) { create(:album, user: user) }
  let!(:prefecture) { create(:prefecture) }
  let!(:city) { create(:city, prefecture: prefecture) }
  before do
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_on 'commit'
  end

  describe '# INDEX(new)-page-test' do
    before do
      visit posts_path
    end
    context 'common contents when visit as authorized or guest user' do
      it "contains a text 'other posts'" do
        expect(page).to have_text(I18n.t('posts.index.post_o'))
      end
    end
    context 'visit as authorized user' do
      it 'contains a page-title' do
        expect(page).to have_content(I18n.t('posts.index.new_form'))
      end
      it 'contains a image-form' do
        expect(page).to have_field 'post[image]'
      end
      it 'contains a title-form' do
        expect(page).to have_field 'post[title]'
      end
      it 'contains a comment-form' do
        expect(page).to have_field 'post[comment]'
      end
      it 'contains a genre-select-box' do
        expect(page).to have_field 'post[genre_id]'
      end
      it 'contains a prefecture-select-box' do
        expect(page).to have_field 'post[prefecture_id]'
      end
      it 'contains a city-select-box' do
        expect(page).to have_field 'post[city_id]'
      end
      it "contains a text 'your posts'" do
        expect(page).to have_text(I18n.t('posts.index.post_y'))
      end
    end
    context 'check function of create-form'  do
      before do
        fill_in 'post[title]', with: 'nice'
        fill_in 'post[comment]', with: 'good'

        gen_el = find('#post_genre_id > option:nth-child(2)').text
        select(gen_el, from: 'post_genre_id', match: :first)
        pre_el = find('#post_prefecture_id > option:nth-child(2)').text
        select(pre_el, from: 'post_prefecture_id', match: :first)
        cit_el = find('#post_city_id> option:nth-child(1)').text
        select(cit_el, from: 'post_city_id', match: :first)
      end
      it 'create a post successfully' do
        click_on 'commit'
        expect(page).to have_content I18n.t('posts.flash.s_alert')
      end
      it 'failed to create a post' do
        fill_in 'post[title]', with: ''
        click_on 'commit'
        expect(page).to have_content I18n.t('posts.flash.s_alert')
        expect(current_path).to eq('/ja/posts')
      end
    end
  end

  describe '# SHOW-page test' do
    context "common contents between own and the other's page" do
      before do
        visit post_path(id: post)
      end
      it 'contains a pagetitle' do
        expect(page).to have_content I18n.t('posts.show.pagetitle')
      end
      it 'contains a post-user-name' do
        expect(page).to have_content post.user.name
      end
      it 'contains a post-title' do
        expect(page).to have_content post.title
      end
      it 'contains a create-date of post' do
        expect(page).to have_content post.created_at.strftime('%Y/%m/%d')
      end
      it 'contains a post-rate' do
        expect(page).to have_content post.rate
      end
      it 'contains a post-prefecture' do
        expect(page).to have_content post.prefecture.en_name
      end
      it 'contains a post-city' do
        expect(page).to have_content post.city.en_name
      end
      it 'contains a post-genre' do
        expect(page).to have_content post.genre.en_name
      end
      it 'contains a post-comment' do
        expect(page).to have_content post.comment
      end
    end
    context 'visit own post detail page' do
      before do
        visit post_path(id: post)
      end
      context 'check contains' do
        it 'contains an edit-button of the post' do
          expect(page).to have_link I18n.t('posts.show.edit_btn'), href: '/ja/posts/' + post.id.to_s + '/edit'
        end
        it 'contains a delete-button of the post' do
          expect(page).to have_link I18n.t('posts.show.delete_btn'), href: '/ja/posts/' + post.id.to_s
        end
      end
      context 'check links' do
        it 'click the link to edit_post_path' do
          click_on I18n.t('posts.show.edit_btn')
          expect(current_path).to eq '/ja/posts/' + post.id.to_s + '/edit'
        end
      end
      context 'check functions' do
        it 'deleting a post' do
          expect {
            click_on I18n.t('posts.show.delete_btn')
            expect(current_path).to eq '/ja/users/' + user.id.to_s
          }.to change(user.posts, :count).by(-1)
        end
      end

    end
    context "visit other's post detail page" do
      before do
        visit post_path(id: post2)
      end
      context 'check contains' do
        it "doesn't contains an edit-button of the post" do
          expect(page).to have_no_link I18n.t('posts.show.edit_btn'), href: '/ja/posts/' + post2.id.to_s + '/edit'
        end
        it "doesn't contains a delete-button of the post" do
          expect(page).to have_no_link I18n.t('posts.show.delete_btn'), href: '/ja/posts/' + post.id.to_s
        end
      end
    end
  end

  describe '# EDIT-page test' do
    before do
      visit edit_post_path(id: post)
    end
    context 'page-trangition to own post-edit page' do
      it 'can transit' do
        expect(current_path).to eq('/posts/' + post.id.to_s + '/edit')
      end
    end
    context "page-trangition to other's post-edit page" do
      it 'cannot transit' do
        visit edit_post_path(id: post2)
        expect(current_path).to eq('/ja/users/' + post.user.id.to_s)
      end
    end
    context 'check page-contents'  do
      it 'contains a pagetitle' do
        expect(page).to have_content I18n.t('posts.edit.pagetitle')
      end
      it 'contains a title-edit-form' do
        expect(page).to have_field 'post[title]', with: post.title
      end
      it 'contains a genre-edit-select-box' do
        gen_el = find('#post_genre_id > option:nth-child(1)').text
        expect(page).to have_select('post[genre_id]'), with: gen_el, match: :first
      end
      it 'contains a prefecture-edit-select-box' do
        pre_el = find('#post_prefecture_id > option:nth-child(1)').text
        expect(page).to have_select('post[prefecture_id]'), with: pre_el
      end
      it 'contains a city-edit-select-box' do
        cit_el = find('#post_city_id > option:nth-child(1)').text
        expect(page).to have_select('post[city_id]'), with: cit_el
      end
      it 'contains a comment-edit-form' do
        expect(page).to have_field 'post[comment]', with: post.comment
      end
      it 'contains a album-edit-select-box' do
        alb_el = find('#post_album_id').text
        expect(page).to have_select('post[album_id]'), with: alb_el
      end
    end
    context 'check function of edit-form'  do
      before do
        visit edit_post_path(id: post)
      end
      it 'edit a post successfully' do
        fill_in 'post[title]', with: 'fantastic'
        click_button 'commit'
        expect(page).to have_content I18n.t('posts.flash.u_notice')
        expect(current_path).to eq '/ja/posts/' + post.id.to_s
      end
      it 'failed to edit a post' do
        fill_in 'post[title]', with: ''
        click_button 'commit'
        expect(page).to have_content I18n.t('posts.flash.u_alert')
        expect(current_path).to eq '/ja/posts/' + post.id.to_s
      end
    end
  end

end

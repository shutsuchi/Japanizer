require 'rails_helper'

describe 'ALBUM-TEST', type: :system do
  let(:user){ create(:user) }
  let!(:user2){ create(:another_user) }
  let!(:album){ create(:album, user: user) }
  let!(:album2){ create(:another_album, user: user2) }
  let!(:post){ create(:post, album: album) }
  before do
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_on 'commit'
  end

  describe '# INDEX(new)-page test' do
    before do
      visit albums_path
    end
    context 'common contents when visit as authorized or guest user' do
      it "contains a text 'others albums'" do
        expect(page).to have_text(I18n.t('albums.index.subtitle_o'))
      end
    end
    context 'visit as authorized user' do
      it 'contains a page-title' do
        expect(page).to have_content(I18n.t('albums.index.new_form'))
      end
      it 'contains a image-form' do
        expect(page).to have_field 'album[image]'
      end
      it 'contains a title-form' do
        expect(page).to have_field 'album[title]'
      end
      it 'contains a comment-form' do
        expect(page).to have_field 'album[comment]'
      end
      it 'contains a genre-select-box' do
        expect(page).to have_field 'album[genre_id]'
      end
      it 'contains a budget-select-box' do
        expect(page).to have_field 'album[budget]'
      end
      it 'contains a people-select-box' do
        expect(page).to have_field 'album[people]'
      end
      it "contains a text 'other albums'" do
        expect(page).to have_text(I18n.t('albums.index.subtitle_o'))
      end
      it "contains a text 'your albums'" do
        expect(page).to have_text(I18n.t('albums.index.subtitle_y'))
      end
    end
    context 'check function of create-form' do
      it 'create a album successfully' do
        fill_in 'album[title]', with: 'nice'
        fill_in 'album[comment]', with: 'good'

        first_gen_el = find("#album_genre_id > option:nth-child(1)").text
        select(first_gen_el, from: "album_genre_id")
        click_on 'commit'
      end
      it 'failed to create a album' do
        click_on 'commit'
        expect(page).to have_content I18n.t('albums.flash.s_alert')
        expect(current_path).to eq('/ja/albums')
      end
    end
  end

  describe '# SHOW-page test' do
    context "common contents between own and the other's page" do
      before do
        visit album_path(id: album)
      end
      it 'contains a pagetitle' do
        expect(page).to have_content I18n.t('albums.show.pagetitle')
      end
      it 'contains a album-user-name'  do
        expect(page).to have_content album.user.name
      end
      it 'contains a album-title' do
        expect(page).to have_content album.title
      end
      it 'contains a album-post_quantity' do
        album.posts.each do |post|
          expect(page).to have_content post.title
        end
      end
      it 'contains a album-rate' do
        expect(page).to have_content album.rate
      end
      it 'contains a album-genre-name' do
        expect(page).to have_content album.genre.en_name
      end
      it 'contains a album-budget' do
        expect(page).to have_content album.budget
      end
      it 'contains a album-people' do
        expect(page).to have_content album.people
      end
      it 'contains a album-comment' do
        expect(page).to have_content album.comment
      end
      it 'contains a album-created_at' do
        expect(page).to have_content album.created_at.strftime('%Y/%m/%d')
      end
    end
    context 'visit own album detail page' do
      before do
        visit album_path(id: album)
      end
      it 'contains an edit-button of the album' do
        expect(page).to have_link I18n.t('albums.show.edit_btn'), href: '/ja/albums/' + album.id.to_s + '/edit'
      end
      it 'contains a delete-button of the album' do
        expect(page).to have_link I18n.t('albums.show.delete_btn'), href: '/ja/albums/' + album.id.to_s
      end
    end
    context "visit other's album detail page" do
      it "doesn't contains an edit-button of the album" do
        expect(page).to have_no_link I18n.t('albums.show.edit_btn'), href: '/ja/albums/' + album.id.to_s + '/edit'
      end
      it "doesn't contains a delete-button of the album" do
        expect(page).to have_no_link I18n.t('albums.show.delete_btn'), href: '/ja/albums/' + album.id.to_s
      end
    end
  end

  describe '# EDIT-page test' do
    before do
      visit edit_album_path(id: album)
    end
    context 'page-transition to own album-edit page' do
      it 'can transit' do
        expect(current_path).to eq('/albums/' + album.id.to_s + '/edit')
      end
    end
    context "page-transition to other's album-edit page" do
      it 'cannot transit' do
        visit edit_album_path(id: album2)
        expect(current_path).to eq('/ja/users/' + album2.user.id.to_s)
      end
    end
    context 'check page-contents' do
      it 'contains a pagetitle' do
        expect(page).to have_content I18n.t('albums.edit.pagetitle')
      end
      it 'contains a title-edit-form' do
        expect(page).to have_field 'album[title]', with: album.title
      end
      it 'contains a genre-edit-select-box' do
        first_gen_el = find("#album_genre_id > option:nth-child(1)").text
        expect(page).to have_select('album[genre_id]'), with: first_gen_el
      end
      it 'contains a budget-edit-select-box' do
        first_bud_el = find("#album_budget > option:nth-child(1)").text
        expect(page).to have_select('album[budget]'), with: first_bud_el
      end
      it 'contains a people-edit-select-box' do
        first_peo_el = find("#album_people > option:nth-child(1)").text
        expect(page).to have_select('album[people]'), with: first_peo_el
      end
      it 'contains a comment-edit-form' do
        expect(page).to have_field 'album[comment]', with: album.comment
      end
      it 'contains a posts-check-box' do
        expect(page).to have_no_checked_field('album[post_quantity][]')
      end
    end
    context 'check function of edit-form' do
      before do
        visit edit_album_path(id: album)
      end
      it 'edit a album successfully' do
        fill_in 'album[title]', with: 'fuuuuu'
        click_button 'commit'
        expect(page).to have_content I18n.t('albums.flash.u_notice')
        expect(current_path).to eq '/ja/albums/' + album.id.to_s
      end
      it 'failed to edit a album' do
        fill_in 'album[title]', with: ''
        click_button 'commit'
        expect(page).to have_content I18n.t('albums.flash.u_alert')
        expect(current_path).to eq '/ja/albums/' + album.id.to_s
      end
    end
  end
end

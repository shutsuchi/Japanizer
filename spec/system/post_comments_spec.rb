require 'rails_helper'

describe 'POSTCOMMENT-TEST', type: :system do
  let(:user) { create(:user) }
  let!(:user2) { create(:another_user) }
  let!(:post) { create(:post, user: user, album: album) }
  let!(:post2) { create(:another_post, user: user2) }
  let!(:album) { create(:album, user: user) }
  before do
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_on 'commit'
  end

  describe '# CREATE' do
    before do
      visit post_path(id: post2)
    end
    context 'check functions' do
      it 'creates a post_comment successfully' do
        # expect do
        #   fill_in 'post_comment[title]', with: 'exentric!!'
        #   fill_in 'post_comment[comment]', with: 'I want to go someday!!'
        #   click_on 'commit'
        # end.to change(post.post_comments, :count).by(0)
      end
      it 'failed to create a post_comment' do
        # fill_in 'post_comment[title]', with: ''
        # click_on 'commit'
        # expect(page).to have_content I18n.t('app.error.er_text_3')
      end
    end
  end
end

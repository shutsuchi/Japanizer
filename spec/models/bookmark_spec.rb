require 'rails_helper'

RSpec.describe 'Bookmark', type: :model do
  describe 'Save' do

    # album_id, user_idがあれば保存可能であること
    context 'Collectly' do
      before do
        @bookmark = Bookmark.new(id: 1)
        user = FactoryBot.create(:user)
        @bookmark.user_id = user.id
        album = FactoryBot.create(:album)
        @bookmark.album_id = album.id
      end
      # can save with all fill in
      it 'with album_id, user_id' do
        expect(@bookmark).to be_valid
      end
    end

    context 'Incollectly' do
      # can't save without album_id
      it 'without a album_id' do
        @bookmark = Bookmark.new(album_id: nil)
        expect(@bookmark.valid?).to eq(false)
      end

      # can't save without user_id
      it 'without a user_id' do
        @bookmark = Bookmark.new(user_id: nil)
        expect(@bookmark.valid?).to eq(false)
      end
    end
  end
end

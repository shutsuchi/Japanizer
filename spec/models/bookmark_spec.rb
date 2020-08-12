# == Schema Information
#
# Table name: bookmarks
#
#  id       :bigint           not null, primary key
#  album_id :integer          not null
#  user_id  :integer          not null
#
require 'rails_helper'

RSpec.describe 'Bookmark', type: :model do
  describe 'validation' do
    let(:bookmark){ create(:bookmark) }

    context 'valid for presence' do
      it 'is valid with album_id, user_id' do
        expect(bookmark).to be_valid
      end
    end

    context 'invalid for presence' do
      it "can't be saved without a album_id" do
        bookmark = Bookmark.new(album_id: nil)
        bookmark.valid?
        expect(bookmark.errors[:album]).to include(I18n.t('errors.messages.blank'))
      end

      it "can't be saved without a user_id" do
        bookmark = Bookmark.new(user_id: nil)
        bookmark.valid?
        expect(bookmark.errors[:user]).to include(I18n.t('errors.messages.blank'))
      end
    end
  end

  describe 'association' do
    context 'belongs to' do
      let!(:user){ create(:user) }
      let!(:album){ create(:album) }
      before { create(:bookmark, id: 1, user: user) }
      before { create(:bookmark, id: 2, album: album) }
      it 'is be able to refer specific user' do
        bookmark_first = user.bookmarks.first
        expect(bookmark_first.id).to eq(1)
      end

      it 'is be able to refer specific album' do
        bookmark_first = album.bookmarks.first
        expect(bookmark_first.id).to eq(2)
      end
    end
  end
end

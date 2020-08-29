# == Schema Information
#
# Table name: albums
#
#  id            :bigint           not null, primary key
#  budget        :string(255)
#  comment       :text(65535)
#  mean          :string(255)
#  people        :integer
#  post_quantity :integer          default(0), not null
#  rate          :float(24)        default(0.0)
#  title         :string(255)      not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  genre_id      :integer          not null
#  image_id      :string(255)
#  user_id       :integer          not null
#
require 'rails_helper'

RSpec.describe 'Album', type: :model do
  describe 'validation' do

    context 'valid for presence' do
      let(:album) { build(:album) }
      it 'is valid with post_quantity, rate, title, user_id, genre_id' do
        expect(album).to be_valid
      end
    end

    context 'invalid for presence' do
      let(:album) { build(:album) }
      let(:user) { create(:user) }
      let(:genre) { create(:genre) }
      it 'is invalid without post_quantity' do
        album.post_quantity = nil
        album.valid?
        expect(album.errors[:post_quantity]).to include(I18n.t('errors.messages.blank'))
      end

      it 'is invalid without title' do
        album.title = nil
        album.valid?
        expect(album.errors[:title]).to include(I18n.t('errors.messages.blank'))
      end

      it 'is invalid without a user_id' do
        album = Album.new(user_id: nil)
        album.valid?
        expect(album.errors[:user]).to include(I18n.t('errors.messages.blank'))
      end

      it 'is invalid without a genre_id' do
        album = Album.new(genre_id: nil)
        album.valid?
        expect(album.errors[:genre]).to include(I18n.t('errors.messages.blank'))
      end
    end
  end

  describe 'association' do
    context 'belongs to' do
      let!(:user) { create(:user) }
      let!(:genre) { create(:genre) }
      before { create(:album, title: 'nice', user: user) }
      before { create(:album, title: 'ok', genre: genre) }
      it 'is be able to refer specific user' do
        album_first = user.albums.first
        expect(album_first.title).to eq('nice')
      end

      it 'is be able to refer specific genre' do
        album_first = genre.albums.first
        expect(album_first.title).to eq('ok')
      end
    end

    context 'has many' do
      let!(:album) { create(:album) }
      before { create(:post, title: 'cool', album: album) }
      before { create(:bookmark, id: 1, album: album) }
      it 'is be able to contain posts' do
        post_first = album.posts.first
        expect(post_first.title).to eq('cool')
      end

      it 'is be able to contain bookmarks' do
        bookmark_first = album.bookmarks.first
        expect(bookmark_first.id).to eq(1)
      end
    end
  end

end

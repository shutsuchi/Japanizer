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
#  rate          :float(24)        not null
#  title         :string(255)      not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  genre_id      :integer          not null
#  image_id      :string(255)
#  user_id       :integer          not null
#
require 'rails_helper'

RSpec.describe 'Album', type: :model do
  describe 'Save' do

    context 'Collectly' do
      # post_quantity, rate, title, user_id, genre_idがあれば保存可能であること
      before do
        user = FactoryBot.create(:user)
        @album = FactoryBot.create(:album)
        #@album = Album.new(
        #  id:             1,
        #  post_quantity: 'good',
        #  rate:          3.5,
        #  title:         'around Japan',
        #  created_at:    'Thu, 06 Aug 2020 21:38:22 +0000',
        #  updated_at:    'Thu, 06 Aug 2020 21:40:24 +0000'
        #)
        @album.user_id = user.id
        genre = FactoryBot.create(:genre)
        @album.genre_id = genre.id
      end
      # can save with all fill in
      it 'with post_quantity, rate, title, user_id, genre_id' do
        expect(@album).to be_valid
      end
    end

    context 'Incollectly' do
      # can't save without post_quantity
      it 'without a post_quantity' do
        @album = Album.new(post_quantity: nil)
        expect(@album.valid?).to eq(false)
      end

      # can't save without rate
      it 'without a rate' do
        @album = Album.new(rate: nil)
        expect(@album.valid?).to eq(false)
      end
      # can't save without title
      it 'without a title' do
        @album = Album.new(title: nil)
        expect(@album.valid?).to eq(false)
      end
      # can't save without user_id
      it 'without a album_id' do
        @album = Album.new(user_id: nil)
        expect(@album.valid?).to eq(false)
      end
      # can't save without genre_id
      it 'without a genre_id' do
        @album = Album.new(genre_id: nil)
        expect(@album.valid?).to eq(false)
      end
    end
  end

  describe 'Belongs' do
    context 'to Specific User' do
      # post_quantity, rate, title, user_id, genre_idがあれば保存可能であること
      before do
        @album = FactoryBot.create(:album)
      end
      # can save with all fill in
      it 'with post_quantity, rate, title, user_id, genre_id' do
        expect(@album).to be_valid
      end
    end
  end
end

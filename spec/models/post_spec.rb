# == Schema Information
#
# Table name: posts
#
#  id            :bigint           not null, primary key
#  comment       :text(65535)      not null
#  rate          :float(24)        not null
#  title         :string(255)      not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  album_id      :integer          not null
#  city_id       :integer          not null
#  genre_id      :integer          not null
#  image_id      :string(255)
#  prefecture_id :integer          not null
#  user_id       :integer          not null
#
require 'rails_helper'

RSpec.describe 'Post', type: :model do
  describe 'validation' do

    context 'valid for presence' do
    let(:post){ create(:post) }
      it 'is valid with title, comment, rate, album_id, city_id, genre_id, prefecutre_id, user_id' do
        expect(post).to be_valid
      end
    end

    context 'invalid for presence' do
      let(:post){ build(:post) }
      it 'is invalid without comment' do
        post.comment = nil
        post.valid?
        expect(post.errors[:comment]).to include('を入力してください')
      end
      it 'is invalid without rate' do
        post.rate = nil
        post.valid?
        expect(post.errors[:rate]).to include('を入力してください')
      end
      it 'is invalid without title' do
        post.title = nil
        post.valid?
        expect(post.errors[:title]).to include('を入力してください')
      end
      it 'is invalid without album_id' do
        post = Post.new(album_id: nil)
        post.valid?
        expect(post.errors[:album]).to include('を入力してください')
      end
      it 'is invalid without city_id' do
        post = Post.new(city_id: nil)
        post.valid?
        expect(post.errors[:city]).to include('を入力してください')
      end
      it 'is invalid without genre_id' do
        post = Post.new(genre_id: nil)
        post.valid?
        expect(post.errors[:genre]).to include('を入力してください')
      end
      it 'is invalid without prefecture_id' do
        post = Post.new(prefecture_id: nil)
        post.valid?
        expect(post.errors[:prefecture]).to include('を入力してください')
      end
      it 'is invalid without user_id' do
        post = Post.new(user_id: nil)
        post.valid?
        expect(post.errors[:user]).to include('を入力してください')
      end
    end
  end

  describe 'association' do
    context 'belongs to' do
      let!(:user){ create(:user) }
      let!(:prefecture){ create(:prefecture) }
      let!(:city){ create(:city) }
      let!(:genre){ create(:genre) }
      let!(:album){ create(:album) }
      before { create(:post, title: 'nice', user: user) }
      before { create(:post, title: 'nice', prefecture: prefecture) }
      before { create(:post, title: 'nice', city: city) }
      before { create(:post, title: 'nice', genre: genre) }
      before { create(:post, title: 'nice', album: album) }
      it 'is be able to refer specific user' do
        post_first = user.posts.first
        expect(post_first.title).to eq('nice')
      end

      it 'is be able to refer specific prefecture' do
        post_first = prefecture.posts.first
        expect(post_first.title).to eq('nice')
      end

      it 'is be able to refer specific city' do
        post_first = city.posts.first
        expect(post_first.title).to eq('nice')
      end

      it 'is be able to refer specific genre' do
        post_first = genre.posts.first
        expect(post_first.title).to eq('nice')
      end

      it 'is be able to refer specific album' do
        post_first = album.posts.first
        expect(post_first.title).to eq('nice')
      end

    end

    context 'has many' do
      let!(:post){ create(:post) }
      before { create(:like, id: 1, post: post) }
      before { create(:postComment, title: 'good', post: post) }
      it 'is be able to contain posts' do
        like_first = post.likes.first
        expect(like_first.id).to eq(1)
      end

      it 'is be able to contain bookmarks' do
        comment_first = post.post_comments.first
        expect(comment_first.title).to eq('good')
      end
    end
  end

end

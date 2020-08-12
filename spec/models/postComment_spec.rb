require 'rails_helper'

RSpec.describe 'PostComment', type: :model do
  describe 'validation' do
    let(:postComment){ create(:postComment) }

    context 'valid for presence' do
      it 'is valid with title, comment, rate, user_id, post_id' do
        expect(postComment).to be_valid
      end
    end

    context 'invalid for prensence' do
      let(:postComment){ build(:postComment) }
      it 'is invalid without comment' do
        postComment.comment = nil
        postComment.valid?
        expect(postComment.errors[:comment]).to include('を入力してください')
      end

      it 'is invalid without rate' do
        postComment.rate = nil
        postComment.valid?
        expect(postComment.errors[:rate]).to include('を入力してください')
      end

      it 'is invalid without rate' do
        postComment.title = nil
        postComment.valid?
        expect(postComment.errors[:title]).to include('を入力してください')
      end

      it 'is invalid without user_id' do
        comment = PostComment.new(user_id: nil)
        comment.valid?
        expect(comment.errors[:user]).to include('を入力してください')
      end

      it 'without a user_id' do
        comment = PostComment.new(post_id: nil)
        comment.valid?
        expect(comment.errors[:post]).to include('を入力してください')
      end
    end
  end

  describe 'association' do
    context 'belongs to' do
      let!(:user){ create(:user) }
      let!(:post){ create(:post) }
      before { create(:postComment, title: 'nice', user: user) }
      before { create(:postComment, title: 'nice', post: post) }
      it 'is be able to refer specific user' do
        comment_first = user.post_comments.first
        expect(comment_first.title).to eq('nice')
      end

      it 'is be able to refer specific genre' do
        comment_first = post.post_comments.first
        expect(comment_first.title).to eq('nice')
      end
    end
  end

end

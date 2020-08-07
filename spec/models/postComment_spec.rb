require 'rails_helper'

RSpec.describe 'PostComment', type: :model do
  describe 'Save' do

    context 'Collectly' do
      before do
        @comment = PostComment.new(
          id:      1,
          comment: 'cool!',
          rate:    5,
          title:   'holiday trip'
        )
        user = FactoryBot.create(:user)
        @comment.user_id = user.id
        post = FactoryBot.create(:post)
        @comment.post_id = post.id
      end
      # can save with all fill in
      it 'with post_id, user_id' do
        expect(@comment).to be_valid
      end
    end

    context 'Incollectly' do
      # can't save without post_id
      it 'without a post_id' do
        @comment = PostComment.new(post_id: nil)
        expect(@comment.valid?).to eq(false)
      end

      # can't save without user_id
      it 'without a user_id' do
        @comment = PostComment.new(user_id: nil)
        expect(@comment.valid?).to eq(false)
      end
    end
  end
end

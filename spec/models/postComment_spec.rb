require 'rails_helper'

RSpec.describe 'PostComment', type: :model do
  describe 'Save' do

    context 'Collectly' do
      before do
        @comment = FactoryBot.create(:postComment)
      end
      it 'with post_id, user_id' do
        expect(@comment).to be_valid
      end
    end

    context 'Incollectly' do
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

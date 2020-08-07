# == Schema Information
#
# Table name: likes
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :integer          not null
#  user_id    :integer          not null
#
require 'rails_helper'

RSpec.describe 'Like', type: :model do
  describe 'Save' do

    context 'Collectly' do
      before do
        @like = Like.new(id: 1)
        user = FactoryBot.create(:user)
        @like.user_id = user.id
        post = FactoryBot.create(:post)
        @like.post_id = post.id
      end
      # can save with all fill in
      it 'with album_id, user_id' do
        expect(@like).to be_valid
      end
    end

    context 'Incollectly' do
      # can't save without post_id
      it 'without a post_id' do
        @like = Like.new(post_id: nil)
        expect(@like.valid?).to eq(false)
      end

      # can't save without user_id
      it 'without a user_id' do
        @like = Like.new(user_id: nil)
        expect(@like.valid?).to eq(false)
      end
    end
  end
end

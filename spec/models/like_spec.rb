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
  describe 'validation' do
    let(:like){ create(:like) }

    context 'valid for presence' do
      # can save with all fill in
      it 'is valid with user_id, post_id' do
        expect(like).to be_valid
      end
    end

    context 'invalid for presence' do
      it 'is invalid without user_id' do
        like = Like.new(user_id: nil)
        like.valid?
        expect(like.errors[:user]).to include(I18n.t('errors.messages.blank'))
      end

      it 'is invalid without post_id' do
        like = Like.new(post_id: nil)
        like.valid?
        expect(like.errors[:post]).to include(I18n.t('errors.messages.blank'))
      end
    end
  end

  describe 'association' do
    context 'belongs to' do
      let!(:user){ create(:user) }
      let!(:post){ create(:post) }
      before { create(:like, id: 1, user: user) }
      before { create(:like, id: 2, post: post) }
      it 'is be able to refer specific user' do
        like_first = user.likes.first
        expect(like_first.id).to eq(1)
      end

      it 'is be able to refer specific genre' do
        like_first = post.likes.first
        expect(like_first.id).to eq(2)
      end
    end
  end
end

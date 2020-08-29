# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  admin                  :boolean          default(FALSE), not null
#  age                    :integer          not null
#  country_code           :string(255)      not null
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  name                   :string(255)      not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string(255)
#  state_code             :string(255)
#  withdrawal_flag        :boolean          default(FALSE), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  image_id               :string(255)
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
require 'rails_helper'

RSpec.describe 'User', type: :model do
  describe 'validation' do

    context 'valid for presence' do
      let(:user) { build(:user) }

      it 'is valid with admin, age, country_code, email, password, name, withdrawal_flag' do
        expect(user).to be_valid
      end
    end

    context 'invalid for presence' do
      let(:user) { build(:user) }
      it 'is invalid without a name' do
        user.name = nil
        user.valid?
        expect(user.errors[:name]).to include(I18n.t('errors.messages.blank'))
      end

      it 'is invalid without a password' do
        user.password = nil
        user.valid?
        expect(user.errors[:password]).to include(I18n.t('errors.messages.blank'))
      end

      it 'is invalid without a email' do
        user = User.new(email: nil)
        user.valid?
        expect(user.errors[:email]).to include(I18n.t('errors.messages.blank'))
      end

      it 'is invalid without a age' do
        user = User.new(age: nil)
        user.valid?
        expect(user.errors[:age]).to include(I18n.t('errors.messages.blank'))
      end

      it 'is invalid without a country_code' do
        user = User.new(country_code: nil)
        user.valid?
        expect(user.errors[:country_code]).to include(I18n.t('errors.messages.blank'))
      end
    end

    context 'valid for boolean' do
      let(:user) { build(:user) }
      it 'is valid true or false for withdrawal_flag' do
        user.withdrawal_flag = true
        expect(user.valid?).to be_truthy
      end

      it 'is valid true or false for admin flag' do
        user.admin = false
        expect(user.valid?).to be_truthy
      end
    end

    context 'invalid for boolean' do
      let(:user) { build(:user) }
      it 'is invalid neither true nor false for withdrawal_flag' do
        user.withdrawal_flag = nil
        user.valid?
        expect(user.errors[:withdrawal_flag]).to include(I18n.t('errors.messages.inclusion'))
      end

      it 'is invalid neither true nor false for admin flag' do
        user.admin = nil
        user.valid?
        expect(user.errors[:admin]).to include(I18n.t('errors.messages.inclusion'))
      end
    end

    context 'valid for length' do
      let(:user) { build(:user) }
      it 'is valid with OVER 6 chracters' do
        user.password = '00000000'
        expect(user.valid?).to be_truthy
      end
    end

    context 'invalid for length' do
      let(:user) { build(:user) }
      it 'is invalid UNDER 6 chracters' do
        user.password = '0'
        user.valid?
        expect(user.errors[:password]).to include(I18n.t('errors.messages.too_short', count: 6))
      end
    end

    context 'valid for email regex' do
      let(:user) { build(:user) }
      it 'is valid if matched with valid_email_regex' do
        user.email = 'iiii@iii'
        expect(user.valid?).to be_truthy
      end

      it 'is invalid if not matched with valid_email_regex' do
        user.email = 'あiiiiiii'
        user.valid?
        expect(user.errors[:email]).to include(I18n.t('errors.messages.invalid'))
      end
    end
  end

  describe 'validation' do
    context 'has many' do
      let!(:user) { create(:user) }
      before { create(:post, title: 'cool', user: user) }
      before { create(:album, title: 'nice', user: user) }
      before { create(:event, title: 'date', user: user) }
      before { create(:postComment, title: 'good', user: user) }
      before { create(:bookmark, id: 1, user: user) }
      before { create(:like, id: 1, user: user) }
      it 'is be able to contain posts' do
        post_first = user.posts.first
        expect(post_first.title).to eq('cool')
      end

      it 'is be able to contain albums' do
        album_first = user.albums.first
        expect(album_first.title).to eq('nice')
      end

      it 'is be able to contain events' do
        event_first = user.events.first
        expect(event_first.title).to eq('date')
      end

      it 'is be able to contain post_comments' do
        comment_first = user.post_comments.first
        expect(comment_first.title).to eq('good')
      end

      it 'is be able to contain bookmarks' do
        bookmark_first = user.bookmarks.first
        expect(bookmark_first.id).to eq(1)
      end

      it 'is be able to contain likes' do
        like_first = user.likes.first
        expect(like_first.id).to eq(1)
      end
    end
  end
end

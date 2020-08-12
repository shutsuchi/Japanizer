# == Schema Information
#
# Table name: events
#
#  id         :bigint           not null, primary key
#  allday     :string(255)
#  body       :text(65535)
#  end        :datetime
#  start      :datetime
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  genre_id   :integer          not null
#  user_id    :integer          not null
#
require 'rails_helper'

RSpec.describe 'Event', type: :model do
  describe 'validation' do

    context 'valid for presence' do
      let(:event){ create(:event) }
      it 'is valid with user_id, genre_id' do
        expect(event).to be_valid
      end
    end

    context 'invalid for presence' do
      it 'is invalid without user_id' do
        event = Event.new(user_id: nil)
        event.valid?
        expect(event.errors[:user]).to include(I18n.t('errors.messages.blank'))
      end

      # can't save without genre_id
      it 'is invalid without a genre_id' do
        event = Event.new(genre_id: nil)
        event.valid?
        expect(event.errors[:genre]).to include(I18n.t('errors.messages.blank'))
      end
    end
  end

  describe 'association' do
    context 'belongs to' do
      let!(:user){ create(:user) }
      let!(:genre){ create(:genre) }
      before { create(:event, id: 1, user: user) }
      before { create(:event, id: 2, genre: genre) }
      it 'is be able to refer specific user' do
        event_first = user.events.first
        expect(event_first.id).to eq(1)
      end

      it 'is be able to refer specific genre' do
        event_first = genre.events.first
        expect(event_first.id).to eq(2)
      end
    end
  end
end

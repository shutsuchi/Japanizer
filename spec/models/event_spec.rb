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
  describe 'Save' do

    context 'Collectly' do
      before do
        @event = FactoryBot.create(:event)
      end
      # can save with all fill in
      it 'with genre_id, user_id' do
        expect(@event).to be_valid
      end
    end

    context 'Incollectly' do
      # can't save without user_id
      it 'without a user_id' do
        @event = Event.new(user_id: nil)
        expect(@event.valid?).to eq(false)
      end

      # can't save without genre_id
      it 'without a genre_id' do
        @event = Event.new(genre_id: nil)
        expect(@event.valid?).to eq(false)
      end
    end
  end
end

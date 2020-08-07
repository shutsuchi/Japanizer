require 'rails_helper'

RSpec.describe 'Event', type: :model do
  describe 'Save' do

    context 'Collectly' do
      before do
        @event = Event.new(id: 1)
        user = FactoryBot.create(:user)
        @event.user_id = user.id
        genre = FactoryBot.create(:genre)
        @event.genre_id = genre.id
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

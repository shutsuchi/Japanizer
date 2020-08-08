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
  describe 'Registered' do

    context 'Validly' do
      before do
         @user = User.new(
           id:              1,
           name:            'tanaka Taro',
           email:           'tanaka@email.com',
           password:        'tanakatanaka',
           age:              24,
           country_code:    'JP',
           withdrawal_flag: false,
           created_at:      'Thu, 06 Aug 2020 21:38:22 +0000',
           updated_at:      'Thu, 06 Aug 2020 21:40:24 +0000'
         )
      end
      it 'is valid with a first_name, last_name, email, and password' do
        expect(@user).to be_valid
      end
    end

    context 'Invalidy' do
      # Invalid without name
      it 'is invalid without a name' do
        @user = User.new(name: nil)
        expect(@user.valid?).to eq(false)
      end

      # Invalid without email
      it 'is invalid without a email' do
        @user = User.new(email: nil)
        expect(@user.valid?).to eq(false)
      end

      # Invalid without age
      it 'is invalid without a age' do
        @user = User.new(age: nil)
        expect(@user.valid?).to eq(false)
      end

      # Invalid without withdrawal_flag
      it 'is invalid without a withdrawal_flag' do
        @user = User.new(withdrawal_flag: true)
        expect(@user.valid?).to eq(false)
      end

      # Invalid without country_code
      it 'is invalid without a country-code' do
        @user = User.new(country_code: nil)
        expect(@user.valid?).to eq(false)
      end
    end

    # context 'when admin register' do
    # end
  end
end

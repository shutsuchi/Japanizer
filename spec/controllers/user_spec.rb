require 'rails_helper'

RSpec.describe User do
  describe '新規登録' do

    context 'when admin register' do
      it 'is valid with a mail and account' do
        user = User.new(
            mail: 'foo@example.com',
            account: 'foo'
         )
        expect(user).to be_valid
      end

    context 'when not admin register' do
      it 'is invalid without a mail' do
        user = User.new(mail: nil)
        user.valid?
        expect(user).errors[:mail].to include("can't be blank")
      end

  end


  describe '登録削除' do

    context 'admin' do
      it 'is valid with a mail and account' do
        user = User.new(
            mail: 'foo@example.com',
            account: 'foo'
         )
        expect(user).to be_valid
      end

    context 'not admin' do
      it 'is invalid without a mail' do
        user = User.new(mail: nil)
        user.valid?
        expect(user).errors[:mail].to include("can't be blank")
      end

  end
end

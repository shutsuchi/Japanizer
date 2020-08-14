require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describes 'GET /users/:id' do
    context 'as an authorized user' do
      context 'request own user page' do
        it 'returns a 200 response' do
        end
        it 'contains a specific word' do
        end
      end
      context 'request other users page' do
        it 'returns a 304 response' do
        end
        it 'redirects the page to /users/:id' do
        end
      end
    end
    context 'as an guest user' do
      it 'returns a 302 response' do
      end
      it 'redirect the page to /top' do
      end
    end
  end

  describes 'GET /users/:id/edit' do
    context 'as an authorized user' do
      context 'request own user page' do
        it 'returns a 200 response' do
        end
        it 'contains a specific word' do
        end
      end
      context 'request other users page' do
        it 'returns a 304 response' do
        end
        it 'redirects the page to /users/:id' do
        end
      end
    end
    context 'as an guest user' do
      it 'returns a 302 response' do
      end
      it 'redirect the page to /top' do
      end
    end
  end

  describes 'GET /users/:user_id/withdraw' do
    context 'as an authorized user' do
      context 'request own user page' do
        it 'returns a 200 response' do
        end
        it 'contains a specific word' do
        end
      end
      context "request other's page" do
        it 'returns a 304 response' do
        end
        it 'redirects the page to /users/:id' do
        end
      end
    end
    context 'as an guest user' do
      it 'returns a 302 response' do
      end
      it 'redirect the page to /top' do
      end
    end
  end

  describes 'PATCH /users/:user_id/switch' do
    context 'as an authorized user' do
      context 'updates own settings' do
        context 'with valid attributes' do
          it 'returns a 200 response' do
          end
          it 'updates a user record' do
          end
          it 'redirects the page to /users/:id' do
          end
        end
        context 'with invalid attributes' do
          it 'returns a 302 response' do
          end
          it 'render the page /users/:id' do
          end
        end
      end
      context "updates other's settings" do
      end
    end
    context 'as a guest user' do
    end
  end

  describes 'PATCH /users/:id' do
    context 'as an authorized user' do
      context 'updates own settings' do
        context 'with valid attributes' do
          it 'returns a 200 response' do
          end
          it 'updates a user record' do
          end
          it 'redirects the page to /users/:id' do
          end
        end
        context 'with invalid attributes' do
          it 'returns a 302 response' do
          end
          it 'render the page /users/:id' do
          end
        end
      end
      context "updates other's settings" do
        it 'returns a 302 response' do
        end
        it 'redirects the page to /users/:id' do
        end
      end
    end
    context 'as a guest user' do
      it 'returns a 302 response' do
      end
      it 'redirects the page to /users/sign_in' do
      end
    end
  end
end

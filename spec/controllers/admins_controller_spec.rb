require 'rails_helper'

describe AdminsController, type: :controller do
  describe '#login' do
    it 'renders the login route' do
      get :login

      expect(response).to render_template(:login)
    end
  end

  describe '#login_submit' do
    let(:admin) { FactoryBot.create(:admin) }

    context 'with bad params' do
      it 'redirects to #login' do
        post :login_submit, params: {}

        expect(response).to redirect_to(:admin_login)
      end
    end

    context 'with valid parameters' do
      let(:params) { { email: admin.email, password: 'test' } }

      it 'logs in the the admin' do
        post :login_submit, params: params

        expect(response).to redirect_to(:admin_dashboard)
      end
    end
  end

  describe '#index' do
    let(:admin) { FactoryBot.create(:admin) }

    context 'when not logged in' do
      it 'renders index' do
        logout
        get :index

        expect(response).to redirect_to(:root)
      end
    end

    context 'when logged in' do
      it 'renders index' do
        login_as(admin)

        get :index

        expect(response).to render_template(:index)
      end
    end
  end

  describe '#show' do
    let(:admin) { FactoryBot.create(:admin) }

    context 'when not logged in' do
      it 'redirects to root' do
        get :show

        expect(response).to redirect_to(:root)
      end
    end

    context 'when logged in' do
      it 'redirects to root' do
        login_as(admin)
        get :show

        expect(response).to render_template(:show)
      end
    end
  end
end

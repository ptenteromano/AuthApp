require 'rails_helper'

describe CustomersController, type: :controller do
  describe '#login' do
    it 'renders the login route' do
      get :login

      expect(response).to render_template(:login)
    end
  end

  describe '#login_submit' do
    let(:customer) { FactoryBot.create(:customer) }

    context 'with bad params' do
      it 'redirects to #login' do
        post :login_submit, params: {}

        expect(response).to redirect_to(:customer_login)
      end
    end

    context 'with valid parameters' do
      let(:params) { { email: customer.email, password: 'test' } }

      it 'logs in the the customer' do
        post :login_submit, params: params

        expect(response).to redirect_to(:customer_dashboard)
      end
    end
  end

  describe '#index' do
    let(:customer) { FactoryBot.create(:customer) }

    context 'when not logged in' do
      it 'renders index' do
        logout
        get :index

        expect(response).to redirect_to(:root)
      end
    end

    context 'when logged in' do
      it 'renders index' do
        login_as(customer)

        get :index

        expect(response).to render_template(:index)
      end
    end
  end

  describe '#show' do
    let(:customer) { FactoryBot.create(:customer) }

    before do
      login_as(customer)
    end

    context 'with a bad uuid' do
      it 'redirects to root' do
        get :show, params: { uuid: 1 }

        expect(response).to redirect_to(:root)
      end
    end

    context 'with a valid uuid' do
      it 'redirects to root' do
        get :show, params: { uuid: customer.uuid }

        expect(response).to render_template(:show)
      end
    end
  end
end

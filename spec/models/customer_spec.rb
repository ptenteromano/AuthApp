require 'rails_helper'

describe Customer do
  context 'on initialize' do
    let(:customer) { FactoryBot.create(:customer) }

    it 'inherits from User' do
      expect(customer.is_a?(User)).to be_truthy
      expect(customer).to be_instance_of(Customer)
    end

    it 'populates admin' do
      expect(customer.admin).to be(false)
    end

    context 'when admin is true' do
      let(:customer) { FactoryBot.build(:customer, admin: true) }

      it 'is invalid' do
        expect(customer).not_to be_valid
        expect(customer.errors[:admin]).to eq(['Must be false'])
      end
    end
  end
end

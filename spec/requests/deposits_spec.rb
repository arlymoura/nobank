 require 'rails_helper'

RSpec.describe DepositsController, type: :request do
  # Deposit. As you add validations to Deposit, be sure to
  # adjust the attributes here as well.
  before(:all) do
    @account = create(:account, balance: 400)
    @account.balance = 400.00
  end
  let(:valid_attributes) { {value: 10, account: @account.account_number} }
  
  let(:invalid_attributes) { {value: -10, account: @account} }

  describe "GET /new" do
    it "renders a successful response" do
      get new_account_deposit_url(@account)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Deposit" do
        expect {
          post account_deposits_url(@account), params: { deposit: valid_attributes }
        }.to change(Deposit, :count).by(1)
      end

      it "redirects to the created deposit" do
        post account_deposits_url(@account), params: { deposit: valid_attributes }
        expect(response).to redirect_to(account_url(@account))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Deposit" do
        expect {
          post account_deposits_url(@account), params: { deposit: invalid_attributes }
        }.to change(Deposit, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post account_deposits_url(@account), params: { deposit: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end
end

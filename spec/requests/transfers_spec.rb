 require 'rails_helper'

RSpec.describe TransfersController, type: :request do
  # Transfer. As you add validations to Transfer, be sure to
  # adjust the attributes here as well.
  before(:all) do
    @account = create(:account, balance: 400)
    @account.balance = 400.00
    @account1 = create(:account, balance: 400)
  end
  let(:valid_attributes) { {value: 10, account: @account1.account_number} }
  
  let(:invalid_attributes) { {value: -10, account: @account1} }

  describe "GET /new" do
    it "renders a successful response" do
      get new_account_transfer_url(@account)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Transfer" do
        expect {
          post account_transfers_url(@account), params: { transfer: valid_attributes }
        }.to change(Transfer, :count).by(1)
      end

      it "redirects to the created transfer" do
        post account_transfers_url(@account), params: { transfer: valid_attributes }
        expect(response).to redirect_to(account_url(@account))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Transfer" do
        expect {
          post account_transfers_url(@account), params: { transfer: invalid_attributes }
        }.to change(Transfer, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post account_transfers_url(@account), params: { transfer: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end
end

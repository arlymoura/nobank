class DepositsController < ApplicationController
  before_action :set_account

  # GET /deposits/new
  def new
    @deposit = Deposit.new
  end

  # POST /deposits
  def create
    @deposit = Deposit.new(deposit_params)
    tservice = TransactionsService.new(@account)
    respond_to do |format|
      if tservice.peform_deposit(@deposit)
        format.html { redirect_to account_path(@account), notice: 'Valor Depositado Com Sucesso!' }
      else
        format.html { render :new }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:account_id])
    end

    # Only allow a list of trusted parameters through.
    def deposit_params
      params.require(:deposit).permit(:value).merge(account_id: @account.id)
    end
end

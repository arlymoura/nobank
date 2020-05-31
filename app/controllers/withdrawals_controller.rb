class WithdrawalsController < ApplicationController
  before_action :set_account

  # GET /withdrawals
  # GET /withdrawals/new
  def new
    @withdrawal = Withdrawal.new
  end

  # POST /withdrawals
  def create
    withdrawal = Withdrawal.new(withdrawal_params)
    @withdrawal = Operations::Withdrawal.call(@account,withdrawal)
 
    respond_to do |format|
      if @withdrawal
        format.html { redirect_to account_path(@account), notice: 'Saque Realizado Com Sucesso!' }
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
    def withdrawal_params
      params.require(:withdrawal).permit(:value).merge(account_id: @account.id)
    end
end

class TransfersController < ApplicationController
  before_action :set_account

  # GET /transfers/new
  def new
    @transfer = Transfer.new
  end

  # POST /transfers
  def create
    destiny_account = Account.find_by(account_number: params[:transfer][:account])
    
    @transfer = Transfer.new(transfer_params.merge(account: destiny_account))
    tservice = TransactionsService.new(@account)
    
    respond_to do |format|
      if destiny_account.present? && tservice.perform_transfer(@transfer, destiny_account)
        format.html { redirect_to account_path(@account), notice: 'Transferência Realizado Com Sucesso!' }
      else
        format.html { render :new }
      end
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = current_user.account
    end

    # Only allow a list of trusted parameters through.
    def transfer_params
      params.require(:transfer).permit(:value, :account)
    end
end

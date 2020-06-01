class DepositsController < ApplicationController
  before_action :set_account

  # GET /deposits/new
  def new
    @deposit = Deposit.new
  end

  # POST /deposits
  def create
    destiny_account = Account.find_by(account_number: params[:deposit][:account])
    deposit = Deposit.new(deposit_params.merge(account_id: destiny_account.id))
    @deposit = Operations::Deposit.call(@account,deposit)  
 
    respond_to do |format|
      if @deposit
        
        format.html { redirect_to account_path(@account),
                    notice: 'Depósito Realizado Com Sucesso!' } if current_user.present?
        format.html { redirect_to home_index_path,
        notice: 'Depósito Realizado Com Sucesso!' }
      else
        format.html { render :new }
      end
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = nil
      @account = Account.find(params[:account_id]) if params[:account_id].present?

    end

    # Only allow a list of trusted parameters through.
    def deposit_params
      params.require(:deposit).permit(:value, :account_id)
    end
end

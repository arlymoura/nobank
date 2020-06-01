class AccountsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_account, only: [:show, :edit, :update, :destroy]

  # GET /accounts
 

  # GET /accounts/1
  def show
  end

  # GET /accounts/new
  def new
    @account = Account.new
  end

  # GET /accounts/1/edit
  def edit
  end

  # POST /accounts
  # def create
  #   @account = Account.new(account_params)

  #   respond_to do |format|
  #     if @account.save
  #       format.html { redirect_to @account, notice: 'Account was successfully created.' }
  #       format.json { render :show, status: :created, location: @account }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @account.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to @account, notice: 'Conta Autalizada!' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account.update(status: false)
    respond_to do |format|
      format.html { redirect_to accounts_url, notice: 'Conta Encerrada.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      #@account = Account.find(params[:id])
      @account = current_user.account
    end

    # Only allow a list of trusted parameters through.
    def account_params
      params.fetch(:account, {})
    end
end

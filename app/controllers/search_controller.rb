class SearchController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:first_date].present?
      @first_date = Time.zone.parse(params[:first_date]).beginning_of_day
      @last_date = Time.zone.parse(params[:last_date]).end_of_day
      
      if @last_date.present? && @last_date.present?
        date_range = @first_date..@last_date
        @extract_deposits = current_user.account.deposits.where(created_at: date_range)
        @extract_transfers = current_user.account.transfers.where(created_at: date_range)
        @extract_withdrawals = current_user.account.withdrawals.where(created_at: date_range)

        # @extract_deposit = Account.includes(:withdrawals, :deposits, :transfers)
        #                   .joins(:withdrawals, :deposits, :transfers)
        #                   .where(id: current_user.account.id)
        #                   .where(deposits: { created_at: date_range })  
        #           binding.pry
      end
    end
  end
end

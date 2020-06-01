class SearchController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:first_date].present?
      @first_date = params[:first_date]
      @last_date = @first_date
      @last_date = params[:last_date]
      @extract = nil
      
      #binding.pry
      if @last_date.present? && @last_date.present?
      @date_range = @first_date.to_datetime.beginning_of_day..@last_date.to_datetime.end_of_day
      @extract = Account.includes(:withdrawals, :deposits, :transfers)
                      .where(id: current_user.account.id)
                      .where('accounts.withdrawals.created_at= ?', @date_range)
                      .where('deposits.created_at= ?', @date_range)
                      .where('transfers.created_at= ?', @date_range)
      
      
                binding.pry
      end
    end
  end
end

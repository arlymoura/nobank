module Operations
  class TransferRateService < OperationApplicationService
    attr_reader :account, :transfer_value, :schedule, :rate, :transfer_rate
    
    def initialize(transfer_value, schedule = DateTime.now)
      @transfer_value = transfer_value
      #@account = account
      @schedule = schedule
      #@transfer_rate = TransferRate.new(transfer: transfer)
      @rate = 0
    end
    
    def call
      generate_tax
    end

    private
    
    def generate_tax
      rate = calculate_tax
      if (transfer_value > 1000) 
        rate = rate + 10
      end
      rate
    end

    def calculate_tax
     (verify_schedule && verify_day_week != 'Sun' && verify_day_week != 'Sat') ?
      rate = 7 : rate = 5
    end

    def verify_day_week
      Date::ABBR_DAYNAMES[schedule.wday] 
    end

    def verify_schedule
      (schedule.strftime("%H:%M").to_time >= '09:00'.to_time) &&
      ('18:00'.to_time <= schedule.strftime("%H:%M").to_time)
    end

    # def validate_when_saving?
    #   verify_balance(transfer.value + transfer.value) && transfer_rate.save
    # end
  end
 end
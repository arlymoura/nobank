class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable,  and :omniauthable
  after_create :set_account
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
         
  has_one :account
  has_many :deposits, through: :account
  has_many :withdrawals, through: :account
  has_many :transfers, through: :account

  def set_account
    Account.create(user_id: self.id)
  end
end

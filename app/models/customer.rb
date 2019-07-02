class Customer < ApplicationRecord
  has_secure_password
  has_many :financial_instruments, dependent: :destroy
  belongs_to  :city
  has_one :cash_account, dependent: :destroy
end

class Charge < ActiveRecord::Base
  belongs_to :customer
  enum state: [:failed, :disputed, :successful]
end

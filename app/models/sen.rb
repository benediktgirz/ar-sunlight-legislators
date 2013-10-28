class Sen < ActiveRecord::Base
  has_one :state
  has_one :party
end

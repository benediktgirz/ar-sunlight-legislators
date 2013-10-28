class State < ActiveRecord::Base
  has_many :reps
  has_many :senators
end

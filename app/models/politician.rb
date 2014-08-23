class Politician < ActiveRecord::Base
  has_many :notifications
end

class User < ActiveRecord::Base
  has_many :packages
end

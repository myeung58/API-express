class Request < ActiveRecord::Base
  self.inheritance_column = nil # so we can a column called 'type'
  belongs_to :package
end

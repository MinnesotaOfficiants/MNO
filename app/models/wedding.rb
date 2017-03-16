class Wedding < ApplicationRecord
  enum package_type: [:Budget, :Basic, :Standard]
  enum status: [ :open, :assigned, :booked, :closed]
  
  
end

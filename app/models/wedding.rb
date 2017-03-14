class Wedding < ApplicationRecord
  enum package_type: [:Budget, :Basic, :Standard]
  
end

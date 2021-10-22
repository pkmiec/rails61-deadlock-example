class OtherRecord < ApplicationRecord
  self.abstract_class = true

  connects_to database: { writing: :other }
end

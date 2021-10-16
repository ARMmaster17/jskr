class Lead < ApplicationRecord
  belongs_to :source
  has_many :events
end

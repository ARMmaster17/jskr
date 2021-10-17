class Lead < ApplicationRecord
  belongs_to :source
  belongs_to :user
  has_many :events
end

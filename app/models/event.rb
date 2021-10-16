class Event < ApplicationRecord
  belongs_to :state
  belongs_to :lead
end

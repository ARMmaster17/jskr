class Lead < ApplicationRecord
  belongs_to :source
  belongs_to :user
  has_many :events

  def current_status
    if self.events.all.count > 0 then
      return self.events.order(occurred: :desc, id: :desc).first.state.name
    else
      return "-"
    end
  end
end

class HomeController < ApplicationController
  def index
    if user_signed_in? then
      @timeline_events = current_user.events.all.joins(:state).group("states.name").group_by_day(:occurred, last: 21).count
      puts @timeline_events
    end
  end
end

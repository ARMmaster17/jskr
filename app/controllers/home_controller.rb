class HomeController < ApplicationController
  def index
    if user_signed_in? then
      @events = current_user.events.all.joins(:state).group(:name).group_by_day(:occurred).count
      puts @events
    end
  end
end

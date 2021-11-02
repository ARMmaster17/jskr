module HomeHelper
  def ucb_next_source
    # UCB method to calculate next source recommendation.
    ucb_sources = Hash.new
    total_t = current_user.events.joins(lead: :source).where("sources.startable = ?", true).count
    startable_sources = current_user.sources.where(startable: true)
    startable_sources.each do |ssrc|
      ssrc_leads = current_user.leads.where(source: ssrc)
      sleads_score = 0
      ssrc_leads.each do |slead|
        if slead.events.count > 0
          sleads_score += slead.events.order(occurred: :desc, id: :desc).first.state.score
        end
      end
      sleads_mean_score = sleads_score.to_f / ssrc_leads.length.to_f
      ucb_sources[ssrc.name] = sleads_mean_score + Math.sqrt((2 * Math.log(total_t)) / ssrc_leads.count)
      if ucb_sources[ssrc.name].nil? or ucb_sources[ssrc.name].nan?
        ucb_sources[ssrc.name] = 0
      end
    end
    return ucb_sources.max_by{|k,v| v}[0]
  end
end

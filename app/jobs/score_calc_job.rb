class ScoreCalcJob < ApplicationJob
  queue_as :default

  def perform(*args)
    new_posts = RawPost.all
    new_posts.each do |np|
      calc_post = Post.new do |c|
        c.title = np.title
        c.company = np.company
        c.source = np.source
        c.description = tag_desc(np.description)
        c.url = np.url
        c.score = calc_score(c.description)
        c.save
      end
      np.destroy
    end
  end
  def calc_score(description)
    score = 0
    score += 3 * description.count('tag-level-3')
    score += 1 * description.count('tag-level-1')
    score += -3 * description.count('tag-level--3')
    return score
  end
  def tag_desc(description)
    keys = Keyword.all
    keys.each do |k|
      description.gsub(k, get_tag(k.weight, k.word))
    end
    return description
  end
  def get_tag(key_level, keyword)
    return "<span class=\"tag-level-#{key_level}\">#{keyword}</span>"
  end
end

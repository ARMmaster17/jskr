Dir[File.dirname(__dir__, '../../lib/sources', '*.rb')].each { |file| require file }

class PullPostingsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    d = Dummy.new
    d.pull_list()
  end
end

class SubredditSubscriber
  attr_reader :url,
              :display_name
  def initialize(details = {})
    @url = details[:url]
    @display_name = details[:display_name]
  end
end

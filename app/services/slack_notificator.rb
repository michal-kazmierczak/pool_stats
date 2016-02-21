class SlackNotificator
  attr_reader :notifier, :message

  def initialize(message)
    @message = message
    @notifier = Slack::Notifier.new(AppConfig["slack"]["webhook_url"],
      channel: AppConfig["slack"]["channel"],
      username: "pool-stats",
      icon_emoji: ":swimmer:")
  end

  def call
    notifier.ping(message)
  end
end
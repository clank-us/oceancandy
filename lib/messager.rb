class Messager

  attr_reader :users

  def self.nofify_users(users)
    new(users).notify_users
  end

  def initialize(users=[])
    @users = users
  end

  def notify_users
    users.each do |user|
      notify(user)
    end
  end

  def notify(user)
    client.account.messages.create(
      body: user.todays_tides_text_body,
      from: ENV.fetch("FROM_PHONE"),
        to: user.phone
    )
    puts user.phone + " - sent"
  end

  private

  def client
    @client ||= Twilio::REST::Client.new(
      ENV.fetch("ACCOUNT_SID"),
      ENV.fetch("AUTH_TOKEN")
    )
  end
end

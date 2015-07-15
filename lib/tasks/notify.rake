namespace :notify do
  desc "Text all users the tide information"
  task tides: :environment do
    Messager.notify_users
  end
end

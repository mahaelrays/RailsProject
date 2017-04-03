class Notification < ApplicationRecord
    after_destroy_commit { NotificationBroadcastJob.perform_later(Notification.count)}
end

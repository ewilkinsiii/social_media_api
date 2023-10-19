class UserTimelineJob < ApplicationJob
  def perform(user_id, action, description)
    UserTimeline.create(user_id: user_id, action: action, description: description)
  end
end

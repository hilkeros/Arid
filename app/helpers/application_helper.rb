# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def activity_log activity
    case activity.action
    when Comment
      "#{activity.user.name} made a comment on the blog post #{link_to activity.target.title post_path(activity.target)}"
    when Friendship
      "#{activity.user.name} is now following #{link_to activity.target.name, profile_path(activity.target)}"
    when Photo
      "#{activity.user.name} has uploaded a #{link_to 'photo', user_photo_path(activity.user, activity.action)}"
    else
      "Oh no he didn't"
    end
  end
end

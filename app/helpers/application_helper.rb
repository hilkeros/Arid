# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def activity_log activity
    case activity.action
    when Comment
      case activity.target
      when Post   then "#{activity.user.name} #{t('activity.blog_comment')} #{link_to activity.target.title post_path(activity.target)}"
      when Photo  then "#{activity.user.name} #{t('activity.photo_comment')} #{link_to t('activity.photo'), user_photo_path(activity.target.user, activity.target)}"
      when Gig    then "#{activity.user.name} #{t('activity.gig_comment')} #{link_to activity.target.venue, gig_path(activity.target)}"
      else
        "#{activity.user.name} #{t('activity.comment')}"
      end
    when Friendship
      "#{activity.user.name} #{t('activity.following')} #{link_to activity.target.name, profile_path(activity.target)}"
    when Photo
      "#{activity.user.name} #{t('activity.photo_upload')} #{link_to t('activity.photo'), user_photo_path(activity.user, activity.action)}"
    when Shout
      "#{activity.user.name} #{t('activity.shout')} #{link_to activity.target.name, profile_path(activity.target)}#{t('activity.profile')}"
    else
      "Oh no he didn't"
    end
  end
  
  def activity_day date
    case 
    when date.today?            then "Today"
    when date == Date.yesterday  then "Yesterday"
    else
      date.strftime('%A')
    end
  end
  
end

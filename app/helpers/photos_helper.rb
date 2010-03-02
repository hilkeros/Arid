module PhotosHelper
  
  def photo_back_link photo, user, gig
    case
    when gig  then link_to("#{t('gigs.back_to_gig')} #{gig.venue}'s", [gig, :photos])
    when user then link_to("#{t('gigs.back_to_gig')} #{user.name}'s photo's", [user, :photos])
    else
      link_to("#{t('gigs.back_to_gig')} photo's", [:photos])
    end
  end
end

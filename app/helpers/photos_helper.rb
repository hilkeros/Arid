module PhotosHelper

  def photo_back_link photo, user, gig
    case
    when gig  then link_to("#{t('gigs.back_to_gig')} #{gig.venue}'s", [gig, :photos])
    when user then link_to("#{t('gigs.back_to_gig')} #{user.name}'s photo's", [user, :photos])
    else
      link_to("#{t('gigs.back_to_gig')} photo's", [:photos])
    end
  end

  def next_link photo, user, gig
    case
    when gig
      next_photo = gig.photos.find(:first, :conditions => ["id > ?", photo.id])
      link_to t('menu.next'), [gig, next_photo] if next_photo.present?
    when user
      next_photo = user.photos.find(:first, :conditions => ["id > ?", photo.id])
      link_to t('menu.next'), [user, next_photo] if next_photo.present?
    else
      next_photo = Photo.arid.find(:first, :conditions => ["id > ?", photo.id])
      link_to t('menu.next'), [next_photo] if next_photo.present?
    end
  end
  
  def previous_link photo, user, gig
    case
    when gig
      previous_photo = gig.photos.find(:last, :conditions => ["id < ?", photo.id])
      link_to t('menu.previous'), [gig, previous_photo] if previous_photo.present?
    when user
      previous_photo = user.photos.find(:last, :conditions => ["id < ?", photo.id])
      link_to t('menu.previous'), [user, previous_photo] if previous_photo.present?
    else
      previous_photo = Photo.arid.find(:last, :conditions => ["id < ?", photo.id])
      link_to t('menu.previous'), [previous_photo] if previous_photo.present?
    end
  end
end
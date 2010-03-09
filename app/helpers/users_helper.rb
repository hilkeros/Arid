module UsersHelper
  
  def myspace_link uid
    case
    when uid.match(/^^(www.)?myspace.com\/\w+$/)
      link_to(image_tag('icons/social/IconMyspaceSml.png'), "http://#{uid}")
    when !uid.match(/myspace.com/)
      link_to(image_tag('icons/social/IconMyspaceSml.png'), "http://myspace.com/#{uid}")
    else
      link_to(image_tag('icons/social/IconMyspaceSml.png'), uid)
    end
  end
  
  def twitter_link uid
      case
      when uid.match(/^^(www.)?twitter.com\/\w+$/)
        link_to(image_tag('icons/social/IconTwitterSml.png'), "http://#{uid}")
      when !uid.match(/twitter.com/)
        link_to(image_tag('icons/social/IconTwitterSml.png'), "http://twitter.com/#{uid}")
      else
        link_to(image_tag('icons/social/IconTwitterSml.png'), uid)
      end
    end
    
    def netlog_link uid
      case
      when uid.match(/^^(www.)?netlog.com\/\w+$/)
        link_to(image_tag('icons/social/IconNetlogSml.png'), "http://#{uid}")
      when !uid.match(/netlog.com/)
        link_to(image_tag('icons/social/IconNetlogSml.png'), "http://netlog.com/#{uid}")
      else
        link_to(image_tag('icons/social/IconNetlogSml.png'), uid)
      end
    end
end

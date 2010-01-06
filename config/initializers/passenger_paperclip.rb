if RAILS_ENV == 'development'
  Paperclip.options[:image_magick_path] = '/opt/local/bin'
end
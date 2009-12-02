# Include the MySQL driver if one hasn't already been loaded
unless defined? Mysql
  begin
    require_library_or_gem 'mysql'
  rescue LoadError => cannot_require_mysql
    # Use the bundled Ruby/MySQL driver if no driver is already in place
    begin
      ActiveRecord::Base.logger.info(
      "WARNING: You're using the Ruby-based MySQL library that ships with Rails. This library is not suited for production. " +
      "Please install the C-based MySQL library instead (gem install mysql)."
      ) if ActiveRecord::Base.logger

      require 'lib/vendored_mysql'
    rescue LoadError
      raise cannot_require_mysql
    end
  end
end
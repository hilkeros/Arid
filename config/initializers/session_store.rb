# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_arid_session',
  :secret      => '0d7cceb403314aeec26e670ef15c0fe32f6b379d1c8c66066707102c8a898a1a9fdfdd70042d47bb7a5d0f9bb4156cf2cd91569ac3a2bdd6088efd0a21719f01'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

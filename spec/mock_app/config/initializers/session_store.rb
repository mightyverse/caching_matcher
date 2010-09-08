# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_rails-2.3.8_session',
  :secret      => 'd284ec0e18b0d49b380996f29145d500b197492931a18c8c9c2d120e322e64511b810f914bb0d332a72d234ce2ad7e4d65c8e7e28a6beadf00113ac40de0626f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

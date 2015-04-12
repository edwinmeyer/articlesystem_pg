# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_articlesystem_pg_session',
  :secret      => '5decd99c7526b202246e1216b71b8204bdadebc41112cfe86ca71d863fc2abbc3192a606935fdc8be8a6477084338aef1945f47c319c6c51020d8acd3a428d9e'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

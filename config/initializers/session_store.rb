# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_gemini_session',
  :secret      => '6d389833433a20fc21e505b3ee77a9b73b87a047d7c956580641c417d12c0f4ab6697c5319ac7ac9622fddf88e6443d4f898a7062213b4d77d5d65a36363956e'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

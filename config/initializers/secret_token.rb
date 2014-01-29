# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
if Rails.env.test? || Rails.env.development? || Rails.env == "profile"
  Utool::Application.config.secret_key_base = "90f53893a9f2a2bc69bf333102c938abc1d4c8213b5826962fea2646efde1b878f43ebdbc4c21b19dc3c4c38467c82390057b5b998543d22f09c6a847a53f98c"
else
  raise "You must set a secret token in ENV['SECRET_TOKEN'] or in config/initializers/secret_token.rb" if ENV['SECRET_TOKEN'].blank?
  Utool::Application.config.secret_key_base = ENV['SECRET_TOKEN']
end
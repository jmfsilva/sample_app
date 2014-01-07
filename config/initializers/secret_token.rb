# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.
require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    # Use the existing token.
    File.read(token_file).chomp
  else
    # Generate a new token and store it in token_file.
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end
# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
SampleApp::Application.config.secret_key_base = 'ed417c18faeb551961c6d0b1d520543b8d9cc88b085b91d89df27627ef342a236b7c5c98ad450de3b4d871dd393fe87af3b56b9a5dc0226630bc6f873f56cf2d'

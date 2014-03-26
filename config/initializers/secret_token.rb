# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
TaskManager::Application.config.secret_key_base = 'f5f19f945536b90c4812a86d1c65fc3c676ce29d59db62eadf653b8c1b0f6eef855bc4a9a821ae889c3b9de2eb5b29e01a816b2147daf5e8b9e5d3b216b92668'

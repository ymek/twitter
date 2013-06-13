require 'twitter/base'

module Twitter
  class RequestToken < Twitter::Base
    attr_reader :oauth_token, :oauth_token_secret, :oauth_callback_confirmed
  end
end

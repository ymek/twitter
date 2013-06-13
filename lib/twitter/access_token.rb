require 'twitter/base'

module Twitter
  class AccessToken < Twitter::Base
    attr_reader :oauth_token, :oauth_token_secret, :user_id, :screen_name
  end
end

module Twitter
  class Client
    module User
      def user(user, options={})
        authenticate
        merge_user_into_options!(user, options)
        response = get('users/show', options)
        format.to_s.downcase == 'xml' ? response.user : response
      end

      def users(users, options={})
        authenticate!
        merge_users_into_options!(Array(users), options)
        response = get('users/lookup', options)
        format.to_s.downcase == 'xml' ? response.users : response
      end

      def user_search(query, options={})
        authenticate!
        response = get('users/search', options.merge(:q => query))
        format.to_s.downcase == 'xml' ? response.users : response
      end

      def suggestions(*args)
        authenticate
        options = args.last.is_a?(Hash) ? args.pop : {}
        category = args.first
        response = get(['users/suggestions', category].compact.join('/'), options)
        xml_method = category ? :category : :suggestions
        format.to_s.downcase == 'xml' ? response.send(xml_method) : response
      end

      def profile_image(screen_name, options={})
        authenticate
        get("users/profile_image/#{screen_name}", options, true).headers['location']
      end

      def friends(*args)
        options = args.last.is_a?(Hash) ? args.pop : {}
        user = args.first
        authenticate
        if user
          merge_user_into_options!(user, options)
          response = get('statuses/friends', options)
        else
          response = get('statuses/friends', options)
        end
        format.to_s.downcase == 'xml' ? response.users : response
      end

      def followers(*args)
        options = args.last.is_a?(Hash) ? args.pop : {}
        user = args.first
        authenticate
        if user
          merge_user_into_options!(user, options)
          response = get('statuses/followers', options)
        else
          response = get('statuses/followers', options)
        end
        format.to_s.downcase == 'xml' ? response.users : response
      end
    end
  end
end
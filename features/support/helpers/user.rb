# frozen_string_literal: true

module UserHelper
  class User
    attr_reader :username, :password, :displayname

    def initialize( user = {} )
      @username = user[:username] == "valid@email.com" ?  ENV.fetch("APP_USERNAME") : user[:username]
      @password = user[:password] == "pAssw0rd" ? ENV.fetch("APP_PASSWORD") : user[:password]
    end
  end
end

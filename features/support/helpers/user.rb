# frozen_string_literal: true

module UserHelper
  class User
    attr_reader :username, :password, :displayname

    def initialize
      @username = ENV.fetch("APP_USERNAME")
      @password  = ENV.fetch("APP_PASSWORD")
      @displayname = ENV.fetch("APP_DISPLAYNAME")
    end
  end
end

require "online_users/active_record_extensions"

class ActiveRecord::Base
  extend OnlineUsers::ActiveRecordExtensions::ClassMethods
end

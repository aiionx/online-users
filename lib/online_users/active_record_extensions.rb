module OnlineUsers
  module ActiveRecordExtensions 
    module ClassMethods
      def act_as_tracker
        include ActiveRecordExtensions::InstanceMethods 
      end
    end
    
    module InstanceMethods 
      def online?
      end
    end
  end 
end
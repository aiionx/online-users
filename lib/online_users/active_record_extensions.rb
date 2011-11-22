module OnlineUsers
  module ActiveRecordExtensions 
    module ClassMethods
      def be_online
        after_create :set_session
        include ActiveRecordExtensions::InstanceMethods
        extend ActiveRecordExtensions::OtherClassMethods
      end
    end
    
    module OtherClassMethods 
      def online
        where("session IN (#{$redis.keys("*session*").collect {|x| "'#{x}'" } * ", "})")
      end
    end
    
    module InstanceMethods 
      
      def go_online(seg)
        $redis.set("session#{self.id}", self.id)
        $redis.expire("session#{self.id}", seg)
      end
        
      def online?
        !!$redis.get("session#{self.id}")
      end
      
      protected
      
      def set_session
        update_attribute(:session, "session#{self.id}")
      end
      
    end
  end 
end
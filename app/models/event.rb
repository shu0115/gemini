class Event < ActiveRecord::Base
  
  #---------------#
  # self.get_name #
  #---------------#
  def self.get_name( event_id )
    event = self.find_by_id( event_id, :select => "name" )
    
    unless event.blank?
      return event.name
    else
      return ""
    end
  end

end

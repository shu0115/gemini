class Group < ActiveRecord::Base
  
  #---------------#
  # self.get_name #
  #---------------#
  def self.get_name( group_id )
    group = self.find_by_id( group_id, :select => "name" )
    
    unless group.blank?
      return group.name
    else
      return ""
    end
  end
  
end

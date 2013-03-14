module ApplicationHelper
  def list_of_code
    SecretCode.find(:all,:conditions => ["user_id is null"])
  end  
end

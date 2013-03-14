class SecretCode < ActiveRecord::Base
  attr_accessible :user_id, :code
  belongs_to :user
end

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,:first_name,:last_name,:secret_code,:role
  #validates :secret_code ,:inclusion => { :in => "foobar" }
  # attr_accessible :title, :body
  has_one :source_code, :class_name =>'SecretCode', :foreign_key => 'user_id'
  after_create :create_secret_code
  def create_secret_code
    source_code=SecretCode.find(secret_code)
    source_code.user_id =self.id
    source_code.save
  end 

  def role?
    return true if self.role == 'admin'
  end


end

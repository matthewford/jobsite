class User
  include Mongoid::Document
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable, :validatable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable


    
  references_many :listings

  def to_s
    email
  end
end

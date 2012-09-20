class User < ActiveRecord::Base
  attr_accessor :password, :password_confirmation 
  attr_accessible :pwd, :user_id, :coy, :first_name, :last_name, :email, :contact,
                  :gender, :address, :user_group, :title, :level, :last_login, :pwd_changed,
                  :poc, :member, :branch, :created_by, :created_at, :updated_at,
                  :updated_by, :password, :password_confirmation
            
  before_save { |user| user.user_id = user_id.downcase }
  
  validates :user_id, :presence => true,                                            
                      :uniqueness => { :case_sensitive => false }
                    
  validates :password,:confirmation => true
                      
                       
  def self.authenticate(user_id, submitted_password)
    member = find_by_user_id(user_id)
    if member.nil?
      return nil
    else
      if member.pwd==User.encrypt_password(submitted_password)
        return member
      else
        return nil
      end  
    end
  end 
  
  def self.authenticate_with_salt(id,user_id)
    user = find_by_user_id(user_id)
    (user && user.id==id) ? user : nil
  end 
  
  def self.encrypt_password(pwd)
    pssword = encrypt(pwd)
  end         
   
  def self.encrypt(string)
    secure_hash(string)
  end     
  
  def self.secure_hash(string)
    Digest::MD5.hexdigest(string)
  end  
end

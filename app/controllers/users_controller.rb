class UsersController < ApplicationController
  def new
    @title="signup"
    @user=User.new
  end
  
  def create
    if params[:password].empty?||params[:password_confirmation].empty?||params[:password] !=params[:password_confirmation]
      redirect_to signup_path(:p=>"nm")#not match
    elsif params[:password].length<6
      redirect_to signup_path(:p=>"ts")#too short  
    elsif
      @user=User.new
      @user.coy="natas"
      @user.user_id=params[:user_id]
      @user.email=params[:email]
      @user.pwd=User.encrypt_password(params[:password])
      #@user.last_login=Time.now
      @user.user_group="customer"
      @user.created_by=params[:user_id]
      @user.created_at=Time.now
      @user.updated_by=params[:user_id]
      if @user.save    
        redirect_to signin_path       
      else
        render 'new'
      end  
    end
  end
  
  def get_info_from
    @users=User.find(:all, :conditions=>["user_group !=?","customer"])
  end
  
  def get_to_reply
    @users_natas=User.find(:all, :conditions=>["user_group=? and level=?","natas","Junior"])
    @users_agency=User.find(:all, :conditions=>["user_group=? and poc=?","member","Y"])
  end


end

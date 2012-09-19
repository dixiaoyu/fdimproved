class CasesController < ApplicationController
  def new    
    @members=Member.all
    if params[:agent]=="1"
      @member_id=params[:agent]
      @member=Member.find(params[:agent])
    end
  end
  
  def create
    max_case_id=Case.maximum("id")    
    if max_case_id.nil?
      max_id=1   
    else
      max_id=max_case_id+1     
    end
    case_id ="NC" + '%08d' % max_id      
     
    member=params[:member]
    branch=params[:branch]
    category=Category.find(params[:category]).name
    
    s_year=params[:incident]['member(1i)']
    s_month=params[:incident]['member(2i)']
    s_day=params[:incident]['member(3i)']
    incident_date=Date.new(s_year.to_i, s_month.to_i, s_day.to_i).to_s    
     
    content=params[:complaint] 
    @case=Case.new(:case_id=>case_id, :incident_date=>incident_date, :category=>category,
                   :content=>content, :member=>member, :branch=>branch, :status=>"NEW",
                   :created_at=>Time.now, :updated_at=>Time.now,
                   :created_by=>current_user.user_id,:updated_by=>current_user.user_id)
    if @case.save
      redirect_to case_new_path
    end               
  end  
  
  def show
    @members=Member.all
    @categories=Category.all
    if params[:type]=="filter"
      status=params[:status]
      agent_id=params[:agent]
      category_id=params[:cate]
      if params[:agent] !=nil
        agent=Member.find(params[:agent]).member_name
      end
      if params[:cate] != nil
        category=Category.find(params[:cate]).name
      end
      
      if status !=nil && agent_id !=nil && category_id !=nil
        @cases=Case.find(:all, :conditions=>["status=? and member=? and category=?",status,agent,category])
      end
    else  
      if current_user.group=="customer"
        @cases=Case.find(:all, :conditions=>["created_by=?",current_user.user_id])
      end
    end    
  end
  
  def detail
    @case=Case.find_by_case_id(params[:case_id])
    @complaint=User.find_by_user_id(@case.created_by)
    if current_user.group=="customer"
      @responses=Processing.find(:all,:conditions=>["case_id=? and (response_to=? or created_by=?)",
                                 params[:case_id],current_user.user_id,current_user.user_id])     
    end

  end
end

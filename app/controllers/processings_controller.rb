class ProcessingsController < ApplicationController
  def create_response
    @case_id=params[:case_id]
    @case=Case.find_by_case_id(@case_id)
    if current_user.user_group=="customer"
      response=Processing.new(:coy=>"natas",:case_id=>@case_id,:response_content=>params[:content],:response_type=>"reply",
                              :response_to=>params[:response_to],:service_standard=>params[:rate],:created_by=>current_user.user_id,
                              :created_at=>Time.now, :updated_by=>current_user.user_id, :updated_at=>Time.now)
      if response.save
        if params[:operation]=="close"
          @case.update_attributes(:status=>"CLOSE", :updated_by=>current_user.user_id)
        else
          @case.update_attributes(:status=>"PROCESSING", :updated_by=>current_user.user_id)            
        end
        redirect_to case_detail_path(:case_id=>@case_id)
      end                        
    end
  end
end

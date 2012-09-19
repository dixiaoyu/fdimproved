class Case < ActiveRecord::Base
  set_table_name 'cases'
  attr_accessible :coy, :case_id, :incident_date, :category, :content, :member, :branch, :attachment, 
                  :status, :priority, :created_by, :created_at, :updated_at, :updated_by
end

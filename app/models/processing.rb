class Processing < ActiveRecord::Base
  set_table_name 'processings'
  attr_accessible :coy,:case_id,:response_content,:response_to,:response_type,:attachment, :service_standard,
                  :created_by, :created_at, :updated_by, :updated_at
end

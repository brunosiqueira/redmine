class IssuePreRequirement < ActiveRecord::Base
  belongs_to :issue_pre,:class_name=>"Issue",:foreign_key =>"issue_pre_id"
  belongs_to :issue_post,:class_name=>"Issue",:foreign_key =>"issue_post_id"
end

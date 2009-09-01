class ProjectRule < ActiveRecord::Base
  belongs_to :project
  belongs_to :rule
end

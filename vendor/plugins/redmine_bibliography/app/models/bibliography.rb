class Bibliography < ActiveRecord::Base
  has_many :bibliography_projects,:dependent=>:destroy
  has_many :projects,:through => :bibliography_projects
  has_many :authors,:dependent=>:destroy
end

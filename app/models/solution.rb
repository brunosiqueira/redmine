class Solution < ActiveRecord::Base
  belongs_to :rule
  validates_uniqueness_of :name
end

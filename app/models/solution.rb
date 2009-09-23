class Solution < ActiveRecord::Base
  belongs_to :rule
  validates_uniqueness_of :name

  def to_s
    message
  end
end

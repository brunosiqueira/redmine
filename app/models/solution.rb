class Solution < ActiveRecord::Base
  belongs_to :rule
  validates_uniqueness_of :name

  def to_s
    message
  end

  def self.new_solutions
    files = []
    path = "app/rules/solutions/"
    Dir.glob("#{path}*.rb").each do |f|
      name = f[path.length,f.length-3-path.length].camelize
      if Solution.count(:conditions=>{:name=>name}) == 0
        files << name
      end
    end
    files
  end

end

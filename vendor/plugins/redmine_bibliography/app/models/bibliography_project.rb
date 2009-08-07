class BibliographyProject < ActiveRecord::Base
  belongs_to :project
  belongs_to :bibliography
  validates_presence_of :project_id,:bibliography_id
end

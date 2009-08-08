# To change this template, choose Tools | Templates
# and open the template in the editor.

class Website < Bibliography
  validates_presence_of :title,:publishing_date,:url
end

# To change this template, choose Tools | Templates
# and open the template in the editor.

class NewsPaper < Bibliography
  validates_presence_of :title,:publishing_date,:newspaper_title,:local
end

# To change this template, choose Tools | Templates
# and open the template in the editor.

module SolutionDoNothing
  class Form
    include ActionView::Helpers
  end
  def self.html(options={})
    output = "Ignorar<br>"
    output << Form.new.submit_tag("Enviar")
    return output
  end

  def self.create(options)
  end
end

class SolutionDoNothing
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

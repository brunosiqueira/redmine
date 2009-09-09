# To change this template, choose Tools | Templates
# and open the template in the editor.

module SolutionMoveIssueToFinishedVersionAndClose
  class Form
    include ActionView::Helpers
  end

  def self.html(options={})
    output = "Mover para a iteração finalizada e concluir a tarefa<br>"
    output << Form.new.submit_tag("Enviar")
    return output
  end

  def self.create(options)
    issue = options[:issue]
    issue.update_attributes(:status => IssueStatus.find_by_name("Concluída"))
  end
end

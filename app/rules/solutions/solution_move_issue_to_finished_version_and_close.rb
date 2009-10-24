class SolutionMoveIssueToFinishedVersionAndClose

  def self.html(options={})
    output = "Mover para a iteração finalizada e concluir a tarefa<br>"
    return output
  end

  def self.create(options)
    issue = options[:issue]
    issue.update_attributes(:status => IssueStatus.find_by_name("Concluída"))
  end
end

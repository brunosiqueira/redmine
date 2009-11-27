class SolutionRemovePreRequirement

  def self.html(options={})
    output = "Remover o pré-requisito #{options[:issue].pre_requirement} <br>"
    return output
  end

  def self.create(options)
    issue = options[:issue]
    pre = issue.pre_requirement
    issue.pre_requirements.clear
    pre.journals << Journal.new(:user=>options[:current_user],:notes=>"Foi removido dos pré-requisitos de #{issue}")
    issue.journals << Journal.new(:user=>options[:current_user],:notes=>"Durante sua conclusão, o pré-requisito #{pre} foi removido")
  end
end

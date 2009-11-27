# To change this template, choose Tools | Templates
# and open the template in the editor.

class SolutionStartPreRequirement
  def self.html(options={})
    output = "Iniciar a tarefa #{options[:issue].pre_requirement} <br>"
    return output
  end

  def self.create(options)
    issue = options[:issue]
    pre = issue.pre_requirement
    pre.update_attributes :status=>issue.status
    pre.journals << Journal.new(:user=>options[:current_user],:notes=>"Iniciada automaticamente a partir da atualização de #{issue}")
  end
end

# To change this template, choose Tools | Templates
# and open the template in the editor.

module SolutionClosePreRequirement
  class Form
    include ActionView::Helpers
  end

  def self.html(options={})
    output = "Concluír a tarefa #{options[:issue].pre_requirement} <br>"
    output << Form.new.submit_tag("Enviar")
    return output
  end

  def self.create(options)
    issue = options[:issue]
    pre = issue.pre_requirement
    pre.update_attributes :status=>issue.status
    pre.journals << Journal.new(:user=>options[:current_user],:notes=>"Concluída automaticamente a partir da conclusão de #{issue}")
  end
end

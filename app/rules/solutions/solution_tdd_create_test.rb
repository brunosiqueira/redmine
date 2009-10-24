# To change this template, choose Tools | Templates
# and open the template in the editor.
class SolutionTddCreateTest
  def self.html(options={})
    output = "Criar uma nova tarefa de teste<br>"
    return output
  end


  def self.create(options)
    issue = options[:issue]
    test = Issue.new issue.attributes
    test.tracker = Tracker.find_by_name "Teste"
    test.subject = "[Teste] #{test.subject}"
    issue.pre_requirements << test
  end
end

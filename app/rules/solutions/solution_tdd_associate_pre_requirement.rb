class SolutionTddAssociatePreRequirement
  class Form
    include ActionView::Helpers
  end

  def self.enabled?(options={})
    tests = Issue.find_tests(options[:project])
    return !tests.empty?
  end

  def self.html(options={})

    output = "Associar tarefa a uma tarefa de teste<br>"
    form = Form.new
    tests = Issue.find_tests(options[:project])
    output << form.select_tag(:pre_requirement_id,form.options_for_select(tests.collect{|i| [i.subject,i.id.to_s]}))
    return output
  end

  def self.create(options)
    issue = options[:issue]
    issue.pre_requirements << Issue.find(options[:params][:pre_requirement_id])
  end
end

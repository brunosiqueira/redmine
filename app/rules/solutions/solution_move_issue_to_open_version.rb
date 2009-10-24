class SolutionMoveIssueToOpenVersion
  class Form
    include ActionView::Helpers
  end

  def self.enabled?(options={})
    versions = Version.find_opened(options[:project])
    return !versions.empty?
  end

  def self.html(options={})
    output = "Mover a tarefa para a iteração em andamento<br>"
    form = Form.new
    versions = Version.find_opened(options[:project])
    output << form.select_tag(:version_id,form.options_for_select(versions.collect{|i| [i.name,i.id.to_s]}))
    return output
  end

  def self.create(options)
    issue = options[:issue]
    issue.fixed_version = Version.find_by_id(options[:params][:version_id])
    issue.save
  end
end

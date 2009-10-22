class SolutionMoveStoryToOpenVersion
  class Form
    include ActionView::Helpers
  end
  class FormCheck
    include FightTheMelons::Helpers::FormMultipleSelectHelper
  end

  def self.html(options={})
    version = Version.find_by_id options[:story].version_id
    output = "Mover as seguintes tarefas para iteração #{version}<br>"
    form = Form.new
    form_check = FormCheck.new
    output << "<fieldset class=\"check_list\">"
    output << form_check.collection_multiple_select_tag("issues",options[:story].opened_issues,:id,:to_s,:selected_items=>options[:story].opened_issue_ids)
    output << "</fieldset>"
    output << form.submit_tag("Enviar")
    return output
  end

  def self.create(options)
    story = options[:story]
    options[:params][:issues].each { |id|
      issue = story.opened_issues.find_by_id id
      issue.update_attributes(:fixed_version_id=>story.version_id) unless issue.nil?
    }
  end
end

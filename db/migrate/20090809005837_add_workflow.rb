class AddWorkflow < ActiveRecord::Migration
  def self.up
    not_initiated = IssueStatus.create :name=>"Não Iniciada",:is_default=>true
    running = IssueStatus.create :name=>"Em Andamento"
    finished = IssueStatus.create :name=>"Concluída",:is_closed=>true
    canceled = IssueStatus.create :name=>"Cancelada"

    role = Role.find_by_name "Professor"

    trackers =[]
    trackers << Tracker.create(:name=>"Desenvolvimento")
    trackers << Tracker.create(:name=>"Teste")
    trackers << Tracker.create(:name=>"Documentação")
    trackers << Tracker.create(:name=>"Pesquisa")
    trackers.each { |tracker|
      Workflow.create(:old_status=>not_initiated,:new_status=>running, :role=>role,:tracker_id=>tracker.id)
      Workflow.create(:old_status=>running,:new_status=>finished, :role=>role,:tracker_id=>tracker.id)
      Workflow.create(:old_status=>not_initiated,:new_status=>canceled, :role=>role,:tracker_id=>tracker.id)
      Workflow.create(:old_status=>running,:new_status=>canceled, :role=>role,:tracker_id=>tracker.id)
    }
  end

  def self.down
    Workflow.destroy_all
    Tracker.destroy_all
    IssueStatus.destroy_all
  end
end

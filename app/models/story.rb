class Story < ActiveRecord::Base
  validates_presence_of :project_id,:title,:description,:approval_criteria
  belongs_to :project
  belongs_to :version
  has_many :issues
  has_many :opened_issues,:class_name=>"Issue",:include=>"status",:conditions => ["issue_statuses.is_closed = ?", false]
  has_many :journals, :as => :journalized, :dependent => :destroy
  belongs_to :author, :class_name => 'User', :foreign_key => 'author_id'
  #  after_save :create_journal
  after_save :check_rules_save
  before_update :check_rules_update
  
  acts_as_searchable :columns => ['title', "description", "#{Journal.table_name}.notes"],
    :include => [:project, :journals],
    # sort by id so that limited eager loading doesn't break with postgresql
  :order_column => "#{table_name}.id"

  acts_as_activity_provider :find_options => {:include => [:project, :author, :tracker]},
    :author_key => :author_id


  #  def init_journal(user, notes = "")
  #    @current_journal ||= Journal.new(:journalized => self, :user => user, :notes => notes)
  #    @story_before_change = self.clone
  #    @custom_values_before_change = {}
  #    @current_journal
  #  end
  #
  #  private
  #
  #  def create_journal
  #    @story_before_change||=Story.find_by_id(self.id ||Story.new)
  #    if @current_journal
  #      # attributes changes
  #      (Story.column_names - %w(id created_on updated_on)).each {|c|
  #        @current_journal.details << JournalDetail.new(:property => 'attr',
  #          :prop_key => c,
  #          :old_value => @story_before_change.send(c),
  #          :value => send(c)) unless send(c)==@story_before_change.send(c)
  #      }
  #      @current_journal.save
  #    end
  #  end
  def invalid_rules
    @invalid_rules || []
  end
  
  private

  def check_rules_save
    rules = Rule.find :all,:include=>:project_rules,:conditions=>["process_type=? and importance=? and project_rules.project_id=? and action=?",Story.name,"low",self.project_id,"create"]
    @invalid_rules ||= []
    rules.each { |rule|
      @invalid_rules << rule unless rule.valid_rule?(self)
    }
  end

  def check_rules_update
    rules = Rule.find :all,:include=>:project_rules,:conditions=>["process_type=? and project_rules.project_id=? and action=?",Story.name,self.project_id,"update"]
    @invalid_rules ||= []
    rules.each { |rule|
      @invalid_rules << rule unless rule.valid_rule?(self)
    }
  end

end

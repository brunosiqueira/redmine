class Bibliography < ActiveRecord::Base
  has_many :bibliography_projects,:dependent=>:destroy
  has_many :projects,:through => :bibliography_projects
  has_many :authors,:dependent=>:destroy
  validate :valid_publishing_date

  def self.subclasses_list
    [[l(:label_article),Article.name],[l(:label_book),Book.name], [l(:label_newspaper),NewsPaper.name],[l(:label_website),Website.name]]
  end

  def publishing_date_month
    months = I18n.t("date.month_names")
    months[Date.strptime(self.publishing_date,"%Y-%m-%d").month]
  end

  private
  def valid_publishing_date
    Date.strptime(self.publishing_date,"%Y-%m-%d") unless self.publishing_date.blank? || self.publishing_date.nil?
  rescue
    errors.add :publishing_date,:publishing_date_invalid
  end
end

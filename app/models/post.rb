class Post < ActiveRecord::Base

  belongs_to :author
  validate :is_title_case

   before_validation :make_title_case
   #this happens before validation so gives error to user then after saves to db

   # before_save :email_author_about_post
   #this is useful for actions that doenst modify model

  private

  def is_title_case
    if title.split.any?{|w|w[0].upcase != w[0]}
      errors.add(:title, "Title must be in title case")
    end
  end

  def make_title_case
    self.title = self.title.titlecase
  end
end

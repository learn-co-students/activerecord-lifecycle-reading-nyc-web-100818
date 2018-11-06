class Post < ActiveRecord::Base

  belongs_to :author
  validate :is_title_case

#runs everytime persist (save/create) to db
#BUT is called AFTER VALIDATION! so if try to persist, it doesn't save & p.valid? returns FALSE!
#SO: 1- before_balidation
  #before_save :make_title_case # called AFTER VALIDATION, which it will not be yet, so never makes it to the 'save'

  #solution = 'before validation'
  #1- title cases title
  #2- then validation runs!

  before_validation :make_title_case

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

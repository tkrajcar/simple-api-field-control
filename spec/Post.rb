class Post < ActiveRecord::Base
  def subject_length
    self.subject.length
  end

  def subject_words
    self.subject.split(' ').length
  end
end
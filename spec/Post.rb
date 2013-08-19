class Post < ActiveRecord::Base
  include SimpleAPIFieldControl

  api_include :subject_length
  api_include :subject_words

  def subject_length
    self.subject.length
  end

  def subject_words
    self.subject.split(' ').length
  end
end
class Post < ActiveRecord::Base
  include SimpleAPIFieldControl

  # schema:
  # create_table :posts, :force => true do |t|
  #   t.string :subject
  #   t.string :api_key
  #   t.string :other_secret
  # end

  api_include :subject_length
  api_include :subject_words
  api_exclude :api_key
  api_exclude :other_secret

  def subject_length
    self.subject.length
  end

  def subject_words
    self.subject.split(' ').length
  end
end
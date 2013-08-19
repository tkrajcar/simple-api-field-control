require 'Post'

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => ':memory:'
)

ActiveRecord::Schema.define do
  self.verbose = false
  create_table :posts, :force => true do |t|
    t.string :subject
    t.string :api_key
    t.string :other_secret
  end
end
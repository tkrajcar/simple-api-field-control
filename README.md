# simple-api-field-control

Ever needed to simply include a few calculated fields/virtual attributes/custom methods in your serialization? This gem makes it simple and supports both JSON and XML rendering.

## Usage

1. Include `gem "simple-api-field-control"` in your Gemfile.
2. In your model class where you want to use this module, add `include SimpleAPIFieldControl`.
3. Add one or more `api_include :name_of_method` lines to your model.


Example model file:

```ruby
class Post < ActiveRecord::Base
  include SimpleAPIFieldControl

  def subject_length
    self.subject.length
  end

  def subject_words
    self.subject.split(' ').length
  end

  api_include :subject_length
  api_include :subject_words
end
```

Example output:

```
p = Post.create!(subject: "Hello, people!")
=> #<Post id: 2, subject: "Hello, people!">
puts p.to_json
=> {"id":2,"subject":"Hello, people!","subject_length":14,"subject_words":2}
puts p.to_xml
=> <?xml version="1.0" encoding="UTF-8"?>
<post>
  <id type="integer">2</id>
  <subject>Hello, people!</subject>
  <subject-length type="NilClass">14</subject-length>
  <subject-words type="NilClass">2</subject-words>
</post>
```

## Contributing to simple-api-field-control

* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2013 Tim Krajcar. See LICENSE.txt for
further details.


# simple-api-field-control

[![Gem Version](https://badge.fury.io/rb/simple-api-field-control.png)](http://badge.fury.io/rb/simple-api-field-control)
[![Build Status](https://travis-ci.org/tkrajcar/simple-api-field-control.png?branch=master)](https://travis-ci.org/tkrajcar/simple-api-field-control)

## EOL Notice

**Since getting familiar with [active_model_serializers](https://github.com/rails-api/active_model_serializers), I now consider that gem to be vastly superior to this implementation. I'm keeping this around since it might be interesting to somebody, but have no intention of doing further work on it.**

## Usage

Ever needed to simply include or exclude a few calculated fields/virtual attributes/custom methods in your serialization? This gem makes it simple and supports both JSON and XML rendering.

1. Include `gem "simple-api-field-control"` in your Gemfile.
2. In your model class where you want to use this module, add `include SimpleAPIFieldControl`.
3. Add one or more `api_include :name_of_method` or `api_exclude :name_of_method` lines to your model.


Example model file:

```ruby
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
```

Example output:

```
p = Post.create!(subject: "Hello, people!", api_key: "foo", other_secret: "bar")
=> #<Post id: 1, subject: "Hello, people!", api_key: "foo", other_secret: "bar">
puts p.to_json
{"id":1,"subject":"Hello, people!","subject_length":14,"subject_words":2}
puts p.to_xml
=> <?xml version="1.0" encoding="UTF-8"?>
<post>
  <id type="integer">1</id>
  <subject>Hello, people!</subject>
  <subject-length type="NilClass">14</subject-length>
  <subject-words type="NilClass">2</subject-words>
</post>
```

## Copyright

Copyright (c) 2014 Tim Krajcar. See LICENSE.txt for
further details.


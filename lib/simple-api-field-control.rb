require 'active_support/concern'

module SimpleAPIFieldControl
  extend ActiveSupport::Concern

  included do
    class_attribute :api_include_fields
    class_attribute :api_exclude_fields
  end

  def serializable_hash(options = nil)
    options = { methods: self.class.api_include_fields, except: api_exclude_fields }.merge(options || {})
    super(options)
  end

  module ClassMethods
    def api_include(field)
      self.api_include_fields ||= []
      self.api_include_fields << field
    end

    def api_exclude(field)
      self.api_exclude_fields ||= []
      self.api_exclude_fields << field
    end
  end
end
require_relative '02_searchable'
require 'active_support/inflector'

# Phase IIIa
class AssocOptions
  attr_accessor(
    :foreign_key,
    :class_name,
    :primary_key
  )

  def model_class
    self.class_name.constantize
  end

  def table_name
    model_class.table_name
  end
end

class BelongsToOptions < AssocOptions
  def initialize(name, options = {})
    defaults={
      :foreign_key => "#{name.downcase}_id".to_sym,
      :class_name => name.capitalize,
      :primary_key => :id
    }
    defaults.each_key do |key|
      self.send("#{key}=",options[key] || defaults[key])
    end
  end
end

class HasManyOptions < AssocOptions
  def initialize(name, self_class_name, options = {})
    defaults={
      :foreign_key => "#{self_class_name.downcase}_id".to_sym,
      :class_name => name.singularize.capitalize,
      :primary_key => :id
    }

    defaults.each_key do |key|
      self.send("#{key}=",options[key] || defaults[key])
    end

  end
end

module Associatable
  # Phase IIIb
  def belongs_to(name, options = {})
    options=BelongsToOptions.new(name, options)
    define_method(name) do 
      foreign_key=self.send(options.foreign_key)
      model_class=self.model_class
      model_class.where(options.primary_key=>foreign_key).first

    end

  end

  def has_many(name, options = {})
    # ...
  end

  def assoc_options
    # Wait to implement this in Phase IVa. Modify `belongs_to`, too.
  end
end

class SQLObject
  # Mixin Associatable here...
end

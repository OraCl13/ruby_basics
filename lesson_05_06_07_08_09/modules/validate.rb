# frozen_string_literal: true

module Validation
  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods
    attr_accessor :validations

    def validate(name, type, arg = '')
      self.validations ||= []
      data = { type => { name: name, arg: arg } }
      self.validations.push(data)
    end
  end

  module InstanceMethods
    def validate!
      self.class.validations.each do |data|
        data.each do |type, params|
          value = instance_variable_get("@#{params[:name]}".to_s)
          send(type, value, params[:arg])
        end
      end
    end

    def valid?
      validate!
      true
    rescue StandardError => e
      puts e
      false
    end

    def presence(value, arg)
      raise 'Value should not be empty' if value.nil? || value.empty?
    end

    def format(value, format)
      raise 'Format validation error' if value !~ format
    end

    def type_obj(value, attribute_class)
      raise 'Object is not instance of this class' unless value.is_a?(attribute_class)
    end
  end
end

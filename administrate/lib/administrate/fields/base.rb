require_relative "deferred"

module Administrate
  module Field
    class Base
      def self.with_options(options = {})
        Deferred.new(self, options)
      end

      def self.html_class
        field_type.dasherize
      end

      def initialize(attribute, data, page, options = {})
        @attribute = attribute
        @data = data
        @page = page
        @options = options
      end

      def self.permitted_attribute(attr)
        attr
      end

      def html_class
        self.class.html_class
      end

      def name
        attribute.to_s
      end

      def to_partial_path
        "/fields/#{self.class.field_type}/#{page}"
      end

      attr_reader :attribute, :data, :page

      protected

      attr_reader :options

      def self.field_type
        to_s.split("::").last.underscore
      end
    end
  end
end
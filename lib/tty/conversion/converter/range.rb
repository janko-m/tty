# encoding: utf-8

module TTY
  module Conversion
    class RangeConverter

      attr_reader :target

      attr_reader :source

      def initialize(source = String)
        @source = source
        @target = Range
      end

      # Convert value to Range type with possible ranges
      #
      # @param [Object] value
      #
      # @example
      #   coerce('0,9')  # => (0..9)
      #
      # @example
      #   coerce('0-9')  # => (0..9)
      #
      # @api public
      def convert(value)
        case value.to_s
        when /\A(\-?\d+)\Z/
          ::Range.new($1.to_i, $1.to_i)
        when /\A(-?\d+?)(\.{2}\.?|-|,)(-?\d+)\Z/
          ::Range.new($1.to_i, $3.to_i, $2 == '...')
        when /\A(\w)(\.{2}\.?|-|,)(\w)\Z/
          ::Range.new($1.to_s, $3.to_s, $2 == '...')
        else
          fail InvalidArgument, "#{value} could not be coerced into Range type"
        end
      end
    end # RangeConverter
  end # Conversion
end # TTY

#!/usr/bin/env ruby
# frozen_string_literal: true

require 'pry-byebug'

# Custom Enumerables
# rubocop:disable Metrics/ModuleLength
module Enumerable
  # rubocop:disable Style/For, Style/CaseEquality, Metrics/AbcSize, Metrics/MethodLength, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
  def my_each
    return to_enum(:my_each) unless block_given?

    if is_a?(Hash)
      for key, value in self
        yield(key, value)
      end
    else
      for element in self
        yield(element)
      end
    end
    self
  end

  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    index = 0
    if is_a?(Hash)
      for key, value in self
        yield([key, value], index)
        index += 1
      end
    else
      for element in self
        yield(element, index)
        index += 1
      end
    end
    self
  end

  def my_select
    return to_enum(:my_select) unless block_given?

    if is_a?(Hash)
      selected = {}
      my_each { |key, value| selected[key] = value if yield(key, value) }
    else
      selected = []
      my_each { |element| selected << element if yield element }
    end
    selected
  end

  def my_all?(pattern = nil)
    if pattern
      my_each { |element| return false unless pattern === element }
    elsif block_given?
      if is_a?(Hash)
        my_each { |key, value| return false unless yield(key, value) }
      else
        my_each { |element| return false unless yield(element) }
      end
    else
      my_each { |element| return false unless element }
    end
    true
  end

  def my_any?(pattern = nil)
    if pattern
      my_each { |element| return true if pattern === element }
    elsif block_given?
      if is_a?(Hash)
        my_each { |key, value| return true if yield(key, value) }
      else
        my_each { |element| return true if yield(element) }
      end
    else
      my_each { |element| return true if element }
    end
    false
  end

  def my_none?(pattern = nil)
    if pattern
      my_each { |element| return false if pattern === element }
    elsif block_given?
      if is_a?(Hash)
        my_each { |key, value| return false if yield(key, value) }
      else
        my_each { |element| return false if yield(element) }
      end
    else
      my_each { |element| return false if element }
    end
    true
  end

  def my_count(item = nil)
    count = 0
    if item
      my_each { |element| count += 1 if element == item }
    elsif block_given?
      if is_a?(Hash)
        my_each { |key, value| count += 1 if yield(key, value) }
      else
        my_each { |element| count += 1 if yield(element) }
      end
    else
      my_each { |_element| count += 1 }
    end
    count
  end

  def my_map(proc = nil)
    mapped_array = []
    if proc
      if is_a?(Hash)
        my_each { |key, value| mapped_array << proc.call(key, value) }
      else
        my_each { |element| mapped_array << proc.call(element) }
      end
    elsif block_given?
      if is_a?(Hash)
        my_each { |key, value| mapped_array << yield(key, value) }
      else
        my_each { |element| mapped_array << yield(element) }
      end
    else
      return to_enum(:my_map)
    end
    mapped_array
  end

  def my_inject(*args)
    clone = self.clone.to_a
    raise LocalJumpError, 'No block given' if clone.length > 1 && !block_given? && args.length.zero?
    return clone[0] if clone.length == 1 && !block_given? && args.length.zero?
    return nil if clone.length.zero? && !block_given? && args.length.zero?

    accumulator = args[0] and symbol = args[1] if args.length == 2
    accumulator = args[0] and symbol = nil if args.length == 1 && block_given?
    accumulator = clone.shift and symbol = args[0] if args.length == 1 && !block_given?
    accumulator = clone.shift and symbol = nil if args.length.zero?

    if symbol
      clone.my_each { |element| accumulator = accumulator.send(symbol, element) }
    else
      clone.my_each { |element| accumulator = yield(accumulator, element) }
    end
    accumulator
  end
  # rubocop:enable Style/For, Style/CaseEquality, Metrics/AbcSize, Metrics/MethodLength, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
end
# rubocop:enable Metrics/ModuleLength

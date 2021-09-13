#!/usr/bin/env ruby
# frozen_string_literal: true

require 'pry-byebug'

# Custom Enumerables
module Enumerable
  # rubocop:disable Style/For
  def my_each
    return to_enum(:my_each) unless block_given?

    for element in self
      yield(element)
    end
    self
  end

  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    index = 0
    for element in self
      yield(element, index)
      index += 1
    end
    self
  end
  # rubocop:enable Style/For

  def my_select
    return to_enum(:my_select) unless block_given?

    selected = []
    my_each { |element| selected << element if yield element }
    selected
  end

  # rubocop:disable Style/CaseEquality
  def my_all?(pattern = nil)
    if pattern
      my_each { |element| return false unless pattern === element }
    elsif block_given?
      my_each { |element| return false unless yield(element) }
    else
      my_each { |element| return false unless element }
    end
    true
  end

  def my_any?(pattern = nil)
    if pattern
      my_each { |element| return true if pattern === element }
    elsif block_given?
      my_each { |element| return true if yield(element) }
    else
      my_each { |element| return true if element }
    end
    false
  end

  def my_none?(pattern = nil)
    if pattern
      my_each { |element| return false if pattern === element }
    elsif block_given?
      my_each { |element| return false if yield(element) }
    else
      my_each { |element| return false if element }
    end
    true
  end
  # rubocop:enable Style/CaseEquality

  def my_count(item = nil)
    count = 0
    if item
      my_each { |element| count += 1 if element == item }
    elsif block_given?
      my_each { |element| count += 1 if yield(element) }
    else
      my_each { |_element| count += 1 }
    end
    count
  end

  def my_map(proc = nil)
    mapped_array = []
    if proc
      my_each { |element| mapped_array << proc.call(element) }
    elsif block_given?
      my_each { |element| mapped_array << yield(element) }
    else
      return to_enum(:my_map)
    end
    mapped_array
  end

  # rubocop:disable Metrics/*
  def my_inject(*args)
    clone = self.clone.to_a
    raise LocalJumpError, 'No block given' if clone.length > 1 && !block_given? && args.length.zero?
    return self[0] if clone.length == 1 && !block_given? && args.length.zero?
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
  # rubocop:enable Metrics/*
end

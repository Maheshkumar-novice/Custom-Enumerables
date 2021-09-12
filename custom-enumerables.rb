#!/usr/bin/env ruby
# frozen_string_literal: true

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

    return_array = []
    my_each { |element| return_array << element if yield element }
    return_array
  end

  def my_all?
    my_each { |element| return false unless yield(element) }
    true
  end

  def my_any?
    my_each { |element| return true if yield(element) }
    false
  end

  def my_none?
    my_each { |element| return false if yield(element) }
    true
  end

  def my_count
    count = 0
    my_each { |element| count += 1 if yield(element) }
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

  def my_inject(accumulator = nil)
    accumulator = shift if accumulator.nil?

    my_each { |element| accumulator = yield(accumulator, element) }
    accumulator
  end
end

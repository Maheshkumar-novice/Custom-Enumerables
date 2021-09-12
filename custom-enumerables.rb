#!/usr/bin/env ruby
# frozen_string_literal: true

# Custom Enumerables
module Enumerable
  def my_each
    for element in self
      yield(element)
    end
    self
  end

  def my_each_with_index
    index = 0
    for element in self
      yield(element, index)
      index += 1
    end
    self
  end

  def my_select
    return_array = []
    my_each do |element|
      result = yield element
      return_array << element if result
    end
    return_array
  end

  def my_all?
    my_each do |element|
      return false unless yield(element)
    end
    true
  end

  def my_any?
    my_each do |element|
      return true if yield(element)
    end
    false
  end

  def my_none?
    my_each do |element|
      return false if yield(element)
    end
    true
  end

  def my_count
    count = 0
    my_each do |element|
      count += 1 if yield(element)
    end
    count
  end

  def my_map
    mapped_array = []
    my_each do |element|
      mapped_array << yield(element)
    end
    mapped_array
  end

  def my_inject(accumulator = nil)
    if accumulator.nil?
      accumulator = self[0]
      shift
    end
    my_each do |element|
      accumulator = yield(accumulator, element)
    end
    accumulator
  end
end

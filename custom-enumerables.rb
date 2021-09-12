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
end

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
end

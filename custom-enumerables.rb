#!/usr/bin/env ruby
# frozen_string_literal: true

# Custom Enumerables
module Enumerable
  def my_each
    for element in self
      yield(element)
    end
  end
end

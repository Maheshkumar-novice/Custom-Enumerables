#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../custom-enumerables'

puts 'select vs my_select'
numbers = [1, 2, 3, 4, 5, 1, 2, 2]
puts 'Enumerable#select'
p(numbers.select { |item| item == 2 })
p(numbers.select { |item| item })
p(numbers.select {})
puts 'Enumerable#my_select'
p(numbers.my_select { |item| item == 2 })
p(numbers.my_select { |item| item })
p(numbers.my_select {})
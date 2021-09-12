#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../custom-enumerables'

puts '====================='
puts 'each_with_index vs my_each_with_index'
puts '====================='
numbers = [1, 2, 3, 4, 5]
numbers.each_with_index { |item, index| puts "From each_with_index => #{index}:#{item}" }
lambda = ->(val, index) { p val.even?, index.even? }
numbers.each_with_index(&lambda)
p [].each_with_index
puts
numbers.my_each_with_index { |item, index| puts "From my_each_with_index => #{index}:#{item}" }
numbers.my_each_with_index(&lambda)
p [].my_each_with_index

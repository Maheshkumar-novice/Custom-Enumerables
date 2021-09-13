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
p({}.each_with_index)
{ 1 => 2, 2 => 3, 3 => 4 }.each_with_index { |hash_values, index| p "#{hash_values}: #{index}" }

puts
numbers.my_each_with_index { |item, index| puts "From my_each_with_index => #{index}:#{item}" }
numbers.my_each_with_index(&lambda)
p [].my_each_with_index
p({}.my_each_with_index)
{ 1 => 2, 2 => 3, 3 => 4 }.my_each_with_index { |hash_values, index| p "#{hash_values}: #{index}" }

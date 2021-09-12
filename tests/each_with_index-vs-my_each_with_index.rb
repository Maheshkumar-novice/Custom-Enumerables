#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../custom-enumerables'

puts "====================="
puts 'each_with_index vs my_each_with_index'
puts "====================="
numbers = [1, 2, 3, 4, 5]
numbers.each_with_index { |item, index| puts "From each => #{index}:#{item}" }
p [].each_with_index
puts
numbers.my_each_with_index { |item, index| puts "From my_each => #{index}:#{item}" }
p [].my_each_with_index
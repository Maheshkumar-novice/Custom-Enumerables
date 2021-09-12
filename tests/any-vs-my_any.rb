#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../custom-enumerables'

puts "====================="
puts 'any? vs my_any?'
puts "====================="
numbers = [1, 2, 3, 4, 5]
puts 'any?'
p(numbers.any? { |_item| true })
p(numbers.any? { |_item| false })
p(numbers.any? { |_item| nil })
p(numbers.any? { 1 })
numbers = [1, 2]
p(numbers.any? { |item| item == 1 })
p([].any?)
puts
numbers = [1, 2, 3, 4, 5]
puts 'my_any?'
p(numbers.my_any? { |_item| true })
p(numbers.my_any? { |_item| false })
p(numbers.my_any? { |_item| nil })
p(numbers.my_any? { 1 })
numbers = [1, 2]
p(numbers.my_any? { |item| item == 1 })
p([].my_any?)

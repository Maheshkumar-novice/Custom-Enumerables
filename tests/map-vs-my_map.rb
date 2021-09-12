#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../custom-enumerables'

puts 'map vs my_map'
numbers = [1, 2, 3, 4, 5]
puts 'map'
p(numbers.map { |_item| true })
p(numbers.map { |_item| false })
p(numbers.map { |_item| nil })
p(numbers.map {})
p(numbers.map { 1 })
p(numbers.map { |item| item * item })
numbers = [1, 1, 2, 1]
p(numbers.map { |item| item == 1 })
puts
numbers = [1, 2, 3, 4, 5]
puts 'my_map'
p(numbers.my_map { |_item| true })
p(numbers.my_map { |_item| false })
p(numbers.my_map { |_item| nil })
p(numbers.my_map {})
p(numbers.my_map { 1 })
p(numbers.my_map { |item| item * item })
numbers = [1, 1, 2, 1]
p(numbers.my_map { |item| item == 1 })

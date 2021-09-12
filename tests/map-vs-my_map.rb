#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../custom-enumerables'

puts '====================='
puts 'map vs my_map'
puts '====================='
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

proc = proc { |item| item + 1 }
p numbers.map(&proc)
p(numbers.map { |x| x * 12 })
p(numbers.map { |x| x + 1 }.map(&:even?))
# p(numbers.map(proc) { |x| x + 2 })
p(numbers.map { |x| x + 2 })
p([].map)
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

proc = proc { |item| item + 1 }
p numbers.my_map(&proc)
p(numbers.my_map { |x| x * 12 })
p(numbers.my_map { |x| x + 1 }.my_map(&:even?))
p(numbers.my_map(proc) { |x| x + 2 })
p(numbers.my_map { |x| x + 2 })
p([].my_map)

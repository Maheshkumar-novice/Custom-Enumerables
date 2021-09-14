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
p(numbers.map(&:to_s))
p(numbers.map(&:to_s).map(&:to_sym))
p([].map)
p({ 1 => 2, 2 => 3, 3 => 4 }.map { |k, _v| k })
p({ 1 => 2, 2 => 3, 3 => 4 }.map { |k, v| [k, v] })
p([1, [2, 3]].map { |a, b| [a, b] })
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
p(numbers.my_map(&:to_s))
p(numbers.my_map(&:to_s).my_map(&:to_sym))
p([].my_map)
p({ 1 => 2, 2 => 3, 3 => 4 }.my_map { |k, _v| k })
p({ 1 => 2, 2 => 3, 3 => 4 }.my_map { |k, v| [k, v] })
p([1, [2, 3]].my_map { |a, b| [a, b] })

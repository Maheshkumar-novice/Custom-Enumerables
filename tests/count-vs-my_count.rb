#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../custom-enumerables'

puts '====================='
puts 'count vs my_count'
puts '====================='
numbers = [1, 2, 3, 4, 5]
puts 'count'
p(numbers.count { |_item| true })
p(numbers.count { |_item| false })
p(numbers.count { |_item| nil })
p(numbers.count(&:even?))
p(numbers.count {})
p(numbers.count { 1 })
numbers = [1, 1, 2, 1]
p(numbers.count { |item| item == 1 })
p([].count)
puts
numbers = [1, 2, 3, 4, 5]
puts 'my_count'
p(numbers.my_count { |_item| true })
p(numbers.my_count { |_item| false })
p(numbers.my_count { |_item| nil })
p(numbers.count(&:even?))
p(numbers.my_count {})
p(numbers.my_count { 1 })
numbers = [1, 1, 2, 1]
p(numbers.my_count { |item| item == 1 })
p([].my_count)

#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../custom-enumerables'

puts '====================='
puts 'any? vs my_any?'
puts '====================='
numbers = [1, 2, 3, 4, 5]
puts 'any?'
p(numbers.any? { |_item| true })
p(numbers.any? { |_item| false })
p(numbers.any? { |_item| nil })
p(numbers.any? {})

p([].any?)
p(%w[1 21].any?(/1/))
p(%w[1 21].my_any?('1'))
p(numbers.any?(&:even?))
p(numbers.any?(&:positive?))
p(numbers.any?(Integer))
p([[1, 2], [1, 2]].any?([1, 2]))

p(%w[1 1 1].any?(/1/) { |item| item == 1 })

numbers = [1, 1]
p(numbers.any? { |item| item == 1 })
p([nil, nil].any?)

puts

numbers = [1, 2, 3, 4, 5]
puts 'my_any?'
p(numbers.my_any? { |_item| true })
p(numbers.my_any? { |_item| false })
p(numbers.my_any? { |_item| nil })
p(numbers.my_any? {})

p([].my_any?)
p(%w[1 21].my_any?(/1/))
p(%w[1 21].my_any?('1'))
p(numbers.my_any?(&:even?))
p(numbers.my_any?(&:positive?))
p(numbers.my_any?(Integer))
p([[1, 2], [1, 2]].my_any?([1, 2]))

p(%w[1 1 1].my_any?(/1/) { |item| item == 1 })

numbers = [1, 1]
p(numbers.my_any? { |item| item == 1 })
p([nil, nil].my_any?)

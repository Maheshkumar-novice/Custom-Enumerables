#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../custom-enumerables'

puts '====================='
puts 'none? vs my_none?'
puts '====================='
numbers = [1, 2, 3, 4, 5]
puts 'none?'
p(numbers.none? { |_item| true })
p(numbers.none? { |_item| false })
p(numbers.none? { |_item| nil })
p(numbers.none? {})

p([].none?)
p(%w[1 21].none?(/1/))
p(%w[1 21].my_none?('1'))
p(numbers.none?(&:even?))
p(numbers.none?(&:positive?))
p(numbers.none?(Integer))
p([[1, 2], [1, 2]].none?([1, 2]))

p(%w[1 1 1].none?(/1/) { |item| item == 1 })

numbers = [1, 1]
p(numbers.none? { |item| item == 1 })
p([nil, nil].none?)

puts

numbers = [1, 2, 3, 4, 5]
puts 'my_none?'
p(numbers.my_none? { |_item| true })
p(numbers.my_none? { |_item| false })
p(numbers.my_none? { |_item| nil })
p(numbers.my_none? {})

p([].my_none?)
p(%w[1 21].my_none?(/1/))
p(%w[1 21].my_none?('1'))
p(numbers.my_none?(&:even?))
p(numbers.my_none?(&:positive?))
p(numbers.my_none?(Integer))
p([[1, 2], [1, 2]].my_none?([1, 2]))

p(%w[1 1 1].my_none?(/1/) { |item| item == 1 })

numbers = [1, 1]
p(numbers.my_none? { |item| item == 1 })
p([nil, nil].my_none?)

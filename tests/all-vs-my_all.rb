#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../custom-enumerables'

puts '====================='
puts 'all? vs my_all?'
puts '====================='
numbers = [1, 2, 3, 4, 5]
puts 'all?'
p(numbers.all? { |_item| true })
p(numbers.all? { |_item| false })
p(numbers.all? { |_item| nil })
p(numbers.all? {})

p([].all?)
p(%w[1 21].all?(/1/))
p(%w[1 21].my_all?('1'))
p(numbers.all?(&:even?))
p(numbers.all?(&:positive?))
p(numbers.all?(Integer))
p([[1, 2], [1, 2]].all?([1, 2]))

p(%w[1 1 1].all?(/1/) { |item| item == 1 })

numbers = [1, 1]
p(numbers.all? { |item| item == 1 })
p([nil, nil].all?)

puts

numbers = [1, 2, 3, 4, 5]
puts 'my_all?'
p(numbers.my_all? { |_item| true })
p(numbers.my_all? { |_item| false })
p(numbers.my_all? { |_item| nil })
p(numbers.my_all? {})

p([].my_all?)
p(%w[1 21].my_all?(/1/))
p(%w[1 21].my_all?('1'))
p(numbers.my_all?(&:even?))
p(numbers.my_all?(&:positive?))
p(numbers.my_all?(Integer))
p([[1, 2], [1, 2]].my_all?([1, 2]))

p(%w[1 1 1].my_all?(/1/) { |item| item == 1 })

numbers = [1, 1]
p(numbers.my_all? { |item| item == 1 })
p([nil, nil].my_all?)

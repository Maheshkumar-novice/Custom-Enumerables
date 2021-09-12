#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../custom-enumerables'

puts 'all? vs my_all?'
numbers = [1, 2, 3, 4, 5]
puts 'Enumerable#all?'
p(numbers.all? { |_item| true })
p(numbers.all? { |_item| false })
p(numbers.all? { |_item| nil })
p(numbers.all? {})
numbers = [1, 1]
p(numbers.all? { |item| item == 1 })

numbers = [1, 2, 3, 4, 5]
puts 'Enumerable#my_all?'
p(numbers.my_all? { |_item| true })
p(numbers.my_all? { |_item| false })
p(numbers.my_all? { |_item| nil })
p(numbers.my_all? {})
numbers = [1, 1]
p(numbers.my_all? { |item| item == 1 })

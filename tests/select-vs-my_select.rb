#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../custom-enumerables'

puts '====================='
puts 'select vs my_select'
puts '====================='
numbers = [1, 2, 3, 4, 5, 1, 2, 2]
puts 'select'
p(numbers.select { |item| item == 2 })
p(numbers.select { |item| item })
p(numbers.select {})
p(numbers.select(&:positive?))
p(numbers.select(&:odd?))
p([].select)
p({}.select)
p({ 1 => 2, 2 => 3, 3 => 3 }.select { |_key, value| value == 3 })
puts
puts 'my_select'
p(numbers.my_select { |item| item == 2 })
p(numbers.my_select { |item| item })
p(numbers.my_select {})
p(numbers.my_select(&:positive?))
p(numbers.my_select(&:odd?))
p([].my_select)
p({}.my_select)
p({ 1 => 2, 2 => 3, 3 => 3 }.my_select { |_key, value| value == 3 })

#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../custom-enumerables'

puts 'inject vs my_inject'
numbers = [1, 2, 3, 4, 5]
puts 'inject'
p(numbers.inject(2) { |accumulator, item| accumulator * item })
p(numbers.inject { |accumulator, item| accumulator * item })
p(numbers.inject { |_accumulator, _item| 1 })
p(numbers.inject {})
p(numbers.inject(10_000) {})
puts
puts 'my_inject'
p(numbers.my_inject(2) { |accumulator, item| accumulator * item })
p(numbers.my_inject { |accumulator, item| accumulator * item })
p(numbers.my_inject { |_accumulator, _item| 1 })
p(numbers.my_inject {})
p(numbers.my_inject(10_000) {})

puts "\nMutliply_les Method"
def mutliply_els(array)
  p(array.my_inject { |accumulator, item| accumulator * item })
end

mutliply_els([2, 4, 5])

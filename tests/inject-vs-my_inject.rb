#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../custom-enumerables'

puts '====================='
puts 'inject vs my_inject'
puts '====================='
numbers = [1, 2, 3, 4, 5]
puts 'inject'
p(numbers.inject(2) { |accumulator, item| accumulator * item })
p(numbers.inject { |accumulator, item| accumulator * item })
p(numbers.inject { |_accumulator, _item| 1 })
p(numbers.inject {})
p(numbers.inject(10_000) {})
p((1..10).inject(&:+))
p([].inject)
p((1..10).inject(:+))
p((1..10).inject(10, :+))
p [1].inject
p [1, 2].inject(1, :+) {}
p({ 1 => 2, 2 => 3 }.inject(0) { |acc, (key, val)| acc + val + key })
p({ 1 => 2 }.inject)
p({}.inject)
p(numbers.reduce(2) { |accumulator, item| accumulator * item })
puts
puts 'my_inject'
p(numbers.my_inject(2) { |accumulator, item| accumulator * item })
p(numbers.my_inject { |accumulator, item| accumulator * item })
p(numbers.my_inject { |_accumulator, _item| 1 })
p(numbers.my_inject {})
p(numbers.my_inject(10_000) {})
p((1..10).my_inject(&:+))
p([].my_inject)
p((1..10).my_inject(:+))
p((1..10).my_inject(10, :+))
p [1].my_inject
p [1, 2].my_inject(1, :+) {}
p({ 1 => 2, 2 => 3 }.my_inject(0) { |acc, (key, val)| acc + val + key })
p({ 1 => 2 }.my_inject)
p({}.my_inject)
p(numbers.my_reduce(2) { |accumulator, item| accumulator * item })

puts "\nMutliply_els Method"
def mutliply_els(array)
  p(array.my_inject { |accumulator, item| accumulator * item })
  p(array.inject { |accumulator, item| accumulator * item })
  p(array.my_inject(3) { |accumulator, item| accumulator * item })
  p(array.inject(3) { |accumulator, item| accumulator * item })
end
mutliply_els([2, 4, 5])
# [1,2].inject
# [1, 2].my_inject

#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../custom-enumerables'

puts '====================='
puts 'each vs my_each'
puts '====================='
numbers = [1, 2, 3, 4, 5]
numbers.each { |item| puts "From each => #{item}" }
proc = proc { |item| p item.even? }
numbers.each(&proc)
p([].each)
puts
numbers.my_each { |item| puts "From my_each => #{item}" }
numbers.my_each(&proc)
p([].my_each)
